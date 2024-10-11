# Configuration file for the Sphinx documentation builder.

# -- Project information -- #

project = 'CogWorks'
author = 'CogWorks Team'
html_title = 'CogWeb Fall/Winter'
release = '0.1'


# -- General configuration -- #

extensions = [
    'nbsphinx',
]

templates_path = ['_templates']
exclude_patterns = ['_build']

# -- Options for HTML output -- #

html_theme = "furo"
html_static_path = ['_static']
html_css_files = [
    'css/custom.css',
]

# -- Options for furo output -- #

pygments_style = "xcode"
pygments_dark_style = "github-dark"


# -- Options for nbsphinx output -- #

nbsphinx_execute = 'never'