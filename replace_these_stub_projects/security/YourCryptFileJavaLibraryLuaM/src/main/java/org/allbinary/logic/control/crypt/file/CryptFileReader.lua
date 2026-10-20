-- Generated Code Do Not Modify
-- package org.allbinary.logic.control.crypt.file

-- local InputStream = require("java.io.InputStream")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CryptFileReader = {}
CryptFileReader.__index = CryptFileReader
CryptFileReader.className = "CryptFileReader"


function CryptFileReader.new(decryptedExtension, encryptedExtension)
    local self = setmetatable({}, CryptFileReader)
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

