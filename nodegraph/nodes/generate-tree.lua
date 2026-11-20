return function(inputs, outputs)
    local count = assert(tonumber(inputs[1]), "Node count must be a number")
    assert(count % 1 == 0 and count >= 1 and count <= 100, "Use a node count from 1 to 100")
    local generated = host.call("tree-generator/tree-generator::gen", {
        ["node-count"] = count,
        ["max-depth"] = 0,
        ["max-branching"] = 1,
        ["root-branches"] = 1,
    })
    local tree = {}
    for index, node in ipairs(generated) do
        tree[index] = { parent = node["parent-id"] }
    end
    outputs[1] = tree
end
