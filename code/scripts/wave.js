// A simple spawn schedule for a forest encounter.
// Try changing the interval, then save and reload this file.
export function spawnSchedule(count = 5, interval = 0.75) {
    return Array.from({ length: count }, (_, index) => ({
        enemy: index % 2 === 0 ? "mossling" : "firefly",
        time: index * interval,
        lane: index % 3,
    }))
}
