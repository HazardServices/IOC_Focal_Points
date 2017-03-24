# -*- coding: utf-8 -*-

import sys, os

sys.path.insert(0, os.path.abspath('extensions'))

extensions = ['sphinx.ext.autodoc', 'sphinx.ext.doctest', 'sphinx.ext.todo',
              'sphinx.ext.coverage', 'sphinx.ext.imgmath', 'sphinx.ext.ifconfig',
             ]
#type of files to parse
source_suffix = '.rst'

# name of file that contains the toc
master_doc = 'index'

#appears in the upper left
project = u'Table of Contents'
copyright = u'NOAA Global Systems Division'

version = '0.1'

# -- Options for HTML output ---------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_style = None
html_theme_options = {'collapse_navigation': False}
using_rtd_theme = True
html_title = "IOC Focal Point Guide"
html_short_title = "IOC FPG"
html_use_index = True
display_version = False
# html_theme = "bizstyle"

################################################################################


def setup(app):
     from sphinx.util.texescape import tex_replacements
     tex_replacements += [(u'♮', u'$\\natural$'),
                          (u'ē', u'\=e'),
                          (u'♩', u'\quarternote'),
                          (u'↑', u'$\\uparrow$'),
                          ]
