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
        },
        sass: {
            options: {
                includePaths: ['node_modules/foundation/scss']
            }
        }
    },
    paths: {
        public: '../priv/static'
    },
    npm: {
        styles: {
            'quill': ['dist/quill.core.css', 'dist/quill.snow.css', 'dist/quill.bubble.css'],
            'vue-material': ['dist/vue-material.min.css']
        }
    }
};