local graph = [==[[{"id":1,"kind":2,"name":"Build Resource Pack","x":80,"y":80,"codePath":"../nodes/build-pack.lua","inputs":[],"outputs":[{"id":1,"name":"pack","value":null},{"id":2,"name":"bytes","value":null}]},{"id":2,"kind":1,"name":"Result","x":380,"y":80,"inputs":[{"id":1,"name":"pack","srcNodeId":1,"srcOutputId":1},{"id":2,"name":"bytes","srcNodeId":1,"srcOutputId":2}],"outputs":[]}]]==]
function ng_graph_json() return graph end
return { ng_graph_json = ng_graph_json }
