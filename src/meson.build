getrid_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
  'model.vala',
]

getrid_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1'),
  dependency('gxml-0.20')
]

getrid_sources += gnome.compile_resources('getrid-resources',
  'getrid.gresource.xml',
  c_name: 'getrid'
)

executable('getrid', getrid_sources,
  dependencies: getrid_deps,
       install: true,
)
