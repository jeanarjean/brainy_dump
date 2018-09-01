module.exports = {
    files: {
        javascripts: {
            joinTo: {
                'js/vendor.js': /^(?!app)/,
                'js/app.js': /^app/
            }
        },
        stylesheets: {
            joinTo: {
                'css/vendor.css': /^(?!app)/,
                'css/app.css': /^app/
            }
        },
        templates: {
            joinTo: 'js/app.js'
        }
    },
    plugins: {
        babel: {
            presets: ['es2015']
        },
        vue: {
            extractCSS: true,
            out: '../priv/static/css/components.css'
        }
    },
    paths: {
        public: '../priv/static'
    }
}