return function(inputs, outputs)
    local file = "tree-output.json"
    host.call("fs/fs::write-text", file, json.encode(inputs[1]))
    outputs[1] = file
end
