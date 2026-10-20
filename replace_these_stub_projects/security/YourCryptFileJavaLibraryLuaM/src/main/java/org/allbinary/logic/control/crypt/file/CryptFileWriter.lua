-- Generated Code Do Not Modify
-- package org.allbinary.logic.control.crypt.file

local AbPath = require("org.allbinary.logic.io.path.AbPath")
local Document = require("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CryptFileWriter = {}
CryptFileWriter.__index = CryptFileWriter
CryptFileWriter.className = "CryptFileWriter"


function CryptFileWriter.new(decryptedExtension, encryptedExtension)
    local self = setmetatable({}, CryptFileWriter)
    return self
end


-- throws Exception
function CryptFileWriter:write(fileAbPath, document)
end

return CryptFileWriter

