-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.data.tree.dom


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local URIResolverStrings = {}
URIResolverStrings.__index = URIResolverStrings
URIResolverStrings.className = "URIResolverStrings"

function URIResolverStrings:_init_fields()
    self.IMPORT_URL = "/{import url}"
    self.ATTEMPT = "attempt to use xsl:import: href="
    self.BASE = "\nBase= "
    self.NEW_PATH = "\nNew path= "
    self.NOTE = "\nNote: "
    self.URL_GLOBAL = " is a urlglobal"
    self.REQUIRED_EXTENSION = "\nRequired Extension: "
    self.RESOLVE = "resolve"
end

function URIResolverStrings.new()
    local self = setmetatable({}, URIResolverStrings)
    self:_init_fields()
    return self
end


function URIResolverStrings.getInstance()
        return URIResolverStrings.instance
end

URIResolverStrings.instance = URIResolverStrings.new()

return URIResolverStrings

