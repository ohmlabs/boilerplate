const baseManager  = require('./base-manager');
const ghostManager = Object.assign({}, baseManager, {
  configureCommon(nconf, app) {
    const ghost = require('ghost');
    ghost({
      config: nconf.get('GHOST_CONFIG_PATH')
    }).then(function (ghostServer) {
        app.use(ghostServer.config.paths.subdir, ghostServer.rootApp);
        ghostServer.start(app);
    });
  },
});

module.exports = ghostManager;
