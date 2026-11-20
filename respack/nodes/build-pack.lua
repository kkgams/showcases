return function(inputs, outputs)
    local schema = host.call("fs/fs::read-text", "assets/schema.json")
    local slots = host.call("fs/fs::read-text", "assets/slots.json")
    local pack = "encounter.rspk"
    local bytes = host.call("respack/respack::build-to-file", schema, slots, pack)
    local decoder = host.call("respack/respack::generate-odin", schema)
    host.call("fs/fs::write-text", "encounter_decoder.odin", decoder)
    outputs[1] = pack
    outputs[2] = bytes
end
