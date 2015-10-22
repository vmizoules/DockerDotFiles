# -*- mode: python -*-

block_cipher = None

a = Analysis(['bin/docker-compose'],
             pathex=['.'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None,
             cipher=block_cipher)

pyz = PYZ(a.pure,
             cipher=block_cipher)

exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [('compose/config/fields_schema.json', 'compose/config/fields_schema.json', 'DATA')],
          [('compose/config/service_schema.json', 'compose/config/service_schema.json', 'DATA')],
          name='docker-compose',
          debug=False,
          strip=None,
          upx=True,
          console=True )
