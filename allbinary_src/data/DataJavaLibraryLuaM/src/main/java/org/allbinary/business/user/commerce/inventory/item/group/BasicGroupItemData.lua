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
-- package org.allbinary.business.user.commerce.inventory.item.group

local BasicGroupItemData = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.group.BasicGroupItemData"] = BasicGroupItemData

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

-- class table BasicGroupItemData is declared before the requires
BasicGroupItemData.__index = BasicGroupItemData
BasicGroupItemData.className = "BasicGroupItemData"
BasicGroupItemData.javaClassName = "org.allbinary.business.user.commerce.inventory.item.group.BasicGroupItemData"

function BasicGroupItemData._jinit(self)
    return self
end

function BasicGroupItemData.new()
    return BasicGroupItemData._jinit(setmetatable({}, BasicGroupItemData))
end

BasicGroupItemData.ITEM_ONE = "BASICGROUPITEM_ONE"
BasicGroupItemData.ITEM_TWO = "BASICGROUPITEM_TWO"
BasicGroupItemData.ITEM_THREE = "BASICGROUPITEM_THREE"
BasicGroupItemData.ITEM_FOUR = "BASICGROUPITEM_FOUR"
BasicGroupItemData.ITEM_FIVE = "BASICGROUPITEM_FIVE"
BasicGroupItemData.ITEM_SIX = "BASICGROUPITEM_SIX"
BasicGroupItemData.ITEM_SEVEN = "BASICGROUPITEM_SEVEN"
BasicGroupItemData.ITEM_EIGHT = "BASICGROUPITEM_EIGHT"
BasicGroupItemData.ITEM_NINE = "BASICGROUPITEM_NINE"
BasicGroupItemData.ITEM_TEN = "BASICGROUPITEM_TEN"

return BasicGroupItemData

