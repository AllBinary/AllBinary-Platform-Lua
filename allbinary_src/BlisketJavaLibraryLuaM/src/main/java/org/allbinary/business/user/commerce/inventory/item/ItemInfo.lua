--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.business.user.commerce.inventory.item

local ItemInfo = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.ItemInfo"] = ItemInfo

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

-- class table ItemInfo is declared before the requires
ItemInfo.__index = ItemInfo
ItemInfo.className = "ItemInfo"
ItemInfo.javaClassName = "org.allbinary.business.user.commerce.inventory.item.ItemInfo"

function ItemInfo:_init_fields()
    if self.type == nil then self.type = nil end
    if self.view == nil then self.view = nil end
    if self.data == nil then self.data = nil end
    if self.creationDate == nil then self.creationDate = nil end
    if self.lastModified == nil then self.lastModified = nil end
end


function ItemInfo._jinit(self)
    ItemInfo._init_fields(self)
    return self
end

function ItemInfo.new(...)
    local self = setmetatable({}, ItemInfo)
    ItemInfo._jinit(self, ...)
    return self
end

return ItemInfo

