module.exports = {
    // see <http://truffleframework.com/docs/advanced/configuration/>
    // to customize your truffle configuration!
    networks: {
        development:{
            host: "127.0.0.1",
            port: "7545",
            network_id: "*" // match any network
        }
    }
};