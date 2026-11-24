-- Generated Code Do Not Modify
-- package org.allbinary.logic.control.crypt.file

local CryptFileReader = {}
package.loaded["org.allbinary.logic.control.crypt.file.CryptFileReader"] = CryptFileReader

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local InputStream = require("java.io.InputStream")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CryptFileReader is declared before the requires
CryptFileReader.__index = CryptFileReader
CryptFileReader.className = "CryptFileReader"
CryptFileReader.javaClassName = "org.allbinary.logic.control.crypt.file.CryptFileReader"


function CryptFileReader._jinit(self, decryptedExtension, encryptedExtension)
    return self
end

function CryptFileReader.new(...)
    local self = setmetatable({}, CryptFileReader)
    CryptFileReader._jinit(self, ...)
    return self
end


-- throws Exception
function CryptFileReader:get(fileAbPath)
        return nil
end


-- throws Exception
function CryptFileReader:getInputStream(fileAbPath)
        return nil
end

return CryptFileReader

