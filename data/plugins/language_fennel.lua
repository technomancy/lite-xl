-- mod-version:2 -- lite-xl 2.0
-- Support for the Fennel programming language: https://fennel-lang.org
-- Covers all the keywords up to Fennel version 1.3.1

-- Currently only covers highlighting, not indentation, delimiter
-- matching, or evaluation.

core.add_thread(function()
      if config.plugins["lsp"] and pcall(require, "plugins.lsp") then
         require("plugins.lsp.config").fennells.setup()
      end
end)

-- To regenerate the list of symbols:
[==[
local fennel = require("fennel")
local syntax = {
   ["nil"] = "literal",
   ["true"] = "literal",
   ["false"] = "literal"
}
for name, kw in pairs(fennel.syntax()) do
   if kw["global?"] and not name:find("%.") then
      syntax[name] = "keyword"
   else
      syntax[name] = "keyword2"
   end
end
print(fennel.compile(syntax))
]==]

local syntax = require "core.syntax"

syntax.add {
  name = "Fennel",
  files = "%.fnl$",
  comment = ";",
  patterns = {
    { pattern = ";.-\n",              type = "comment"  },
    { pattern = { '"', '"', '\\' },   type = "string"   },
    { pattern = "0x[%da-fA-F]+",      type = "number"   },
    { pattern = "-?%d+[%d%.]*",       type = "number"   },
    { pattern = "-?%.?%d+",           type = "number"   },
    { pattern = "%f[^(][^()'%s\"]+",  type = "function" },
    { pattern = "[^()'%s\"]+",        type = "symbol"   },
  },

  symbols = {
     ["#"] = "keyword2",
     ["%"] = "keyword2",
     ["*"] = "keyword2",
     ["+"] = "keyword2",
     ["-"] = "keyword2",
     ["->"] = "keyword2",
     ["->>"] = "keyword2",
     ["-?>"] = "keyword2",
     ["-?>>"] = "keyword2",
     ["."] = "keyword2",
     [".."] = "keyword2",
     ["/"] = "keyword2",
     ["//"] = "keyword2",
     [":"] = "keyword2",
     ["<"] = "keyword2",
     ["<="] = "keyword2",
     ["="] = "keyword2",
     [">"] = "keyword2",
     [">="] = "keyword2",
     ["?."] = "keyword2",
     ["^"] = "keyword2",
     _G = "keyword",
     accumulate = "keyword2",
     ["and"] = "keyword2",
     arg = "keyword",
     assert = "keyword",
     band = "keyword2",
     bit32 = "keyword",
     bnot = "keyword2",
     bor = "keyword2",
     bxor = "keyword2",
     case = "keyword2",
     ["case-try"] = "keyword2",
     collect = "keyword2",
     collectgarbage = "keyword",
     comment = "keyword2",
     coroutine = "keyword",
     debug = "keyword",
     ["do"] = "keyword2",
     dofile = "keyword",
     doto = "keyword2",
     each = "keyword2",
     error = "keyword",
     ["eval-compiler"] = "keyword2",
     faccumulate = "keyword2",
     ["false"] = "literal",
     fcollect = "keyword2",
     fn = "keyword2",
     ["for"] = "keyword2",
     getmetatable = "keyword",
     global = "keyword2",
     hashfn = "keyword2",
     icollect = "keyword2",
     ["if"] = "keyword2",
     ["import-macros"] = "keyword2",
     include = "keyword2",
     io = "keyword",
     ipairs = "keyword",
     lambda = "keyword2",
     length = "keyword2",
     let = "keyword2",
     load = "keyword",
     loadfile = "keyword",
     loadstring = "keyword",
     ["local"] = "keyword2",
     lshift = "keyword2",
     lua = "keyword2",
     macro = "keyword2",
     macrodebug = "keyword2",
     macros = "keyword2",
     match = "keyword2",
     ["match-try"] = "keyword2",
     math = "keyword",
     module = "keyword",
     next = "keyword",
     ["nil"] = "literal",
     ["not"] = "keyword2",
     ["not="] = "keyword2",
     ["or"] = "keyword2",
     os = "keyword",
     package = "keyword",
     pairs = "keyword",
     partial = "keyword2",
     pcall = "keyword",
     ["pick-args"] = "keyword2",
     ["pick-values"] = "keyword2",
     print = "keyword",
     quote = "keyword2",
     rawequal = "keyword",
     rawget = "keyword",
     rawlen = "keyword",
     rawset = "keyword",
     require = "keyword",
     ["require-macros"] = "keyword2",
     rshift = "keyword2",
     select = "keyword",
     set = "keyword2",
     ["set-forcibly!"] = "keyword2",
     setmetatable = "keyword",
     string = "keyword",
     table = "keyword",
     tonumber = "keyword",
     tostring = "keyword",
     ["true"] = "literal",
     tset = "keyword2",
     type = "keyword",
     unpack = "keyword",
     unquote = "keyword2",
     values = "keyword2",
     var = "keyword2",
     when = "keyword2",
     ["while"] = "keyword2",
     ["with-open"] = "keyword2",
     xpcall = "keyword",
     ["~="] = "keyword2",
     ["λ"] = "keyword2"}
}

