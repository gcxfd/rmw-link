from os.path import dirname,join,exists,abspath
import configparser

def gitsrc(dirpath):
  config = configparser.ConfigParser()
  config.read(join(dirpath,".git/config"))
  url = config['remote "origin"']['url']
  return url.rsplit("/",1)[0]

ROOT = dirname(dirname(dirname(abspath(__file__))))
GITSRC = gitsrc( ROOT )
