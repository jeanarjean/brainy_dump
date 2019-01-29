import sys
from markdown2 import Markdown
markdowner = Markdown()
result = markdowner.convert(sys.argv[1])
print(result)

