import { runtime, unwrap } from "/core/runtime.js"
import { ViewCanvasBase } from "/util/view-canvas-base.js"

const sourcePath = "art/ui-atlas.png"
const outputPath = "cropped-panel.png"
const image = async (method, ...args) => unwrap(await runtime.invoke(`image/image::${method}`, ...args))

class ImageCropShowcase extends ViewCanvasBase {
    connectedCallback() {
        this.innerHTML = `
            <canvas data-element="canvas" aria-label="Atlas or cropped image"></canvas>
            <aside><form><fieldset><legend>Crop rectangle (pixels)</legend>
                ${[["Left", "x0", 8], ["Top", "y0", 8], ["Right", "x1", 72], ["Bottom", "y1", 56]].map(([label, name, value]) =>
                    `<label>${label}<input type="number" name="${name}" value="${value}" min="0" required autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"></label>`).join("")}
                <button type="submit" class="accent">Crop and save PNG</button>
                <button type="button" data-action="original">Show original</button>
            </fieldset></form></aside>
            <footer><output aria-live="polite"></output></footer>`
        super.connectedCallback()
        this.querySelector("form").addEventListener("submit", event => {
            event.preventDefault()
            const values = new FormData(event.currentTarget)
            void this.perform(() => this.crop(Object.fromEntries([...values].map(([key, value]) => [key, Number(value)]))))
        })
        this.querySelector('[data-action="original"]').addEventListener("click", () => void this.perform(() => this.show(sourcePath)))
        void this.perform(() => this.show(sourcePath))
    }

    async perform(action) {
        const fields = this.querySelector("fieldset")
        fields.disabled = true
        try { await action() }
        catch (error) {
            this.querySelector("output").textContent = String(error)
            await runtime.call("ui.toast.error", { message: String(error) })
        } finally { fields.disabled = false }
    }

    async crop(rect) {
        const source = await image("open", sourcePath)
        try {
            const { width, height } = await image("info", source)
            if (rect.x0 >= rect.x1 || rect.y0 >= rect.y1 || rect.x1 > width || rect.y1 > height) {
                throw new Error(`Choose an ordered rectangle within the ${width} × ${height} atlas.`)
            }
            const crop = await image("crop", source, rect)
            try { await image("save", crop, outputPath, "png") }
            finally { await runtime.releaseResource(crop) }
        } finally { await runtime.releaseResource(source) }
        await this.show(outputPath)
    }

    async show(path) {
        const bytes = unwrap(await runtime.invoke("fs/fs::read-file", path))
        const bitmap = await createImageBitmap(new Blob([Uint8Array.from(bytes)], { type: "image/png" }))
        this.data?.close()
        this.setData(bitmap, { autoFit: true })
        this.querySelector("output").textContent = `${path} · ${bitmap.width} × ${bitmap.height}`
    }

    calculateContentBounds(data) {
        return { minX: 0, minY: 0, maxX: data?.width ?? 0, maxY: data?.height ?? 0 }
    }

    drawContent(context, data) {
        if (data) context.drawImage(data, 0, 0)
    }

    disconnectedCallback() {
        super.disconnectedCallback()
        this.data?.close()
    }
}

customElements.define("view-showcase-crop", ImageCropShowcase)
