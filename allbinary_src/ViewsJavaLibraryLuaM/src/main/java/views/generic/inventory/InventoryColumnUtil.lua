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
-- package views.generic.inventory

local InventoryColumnUtil = {}
package.loaded["views.generic.inventory.InventoryColumnUtil"] = InventoryColumnUtil

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local InventoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")

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

-- class table InventoryColumnUtil is declared before the requires
InventoryColumnUtil.__index = InventoryColumnUtil
InventoryColumnUtil.className = "InventoryColumnUtil"
InventoryColumnUtil.javaClassName = "views.generic.inventory.InventoryColumnUtil"

function InventoryColumnUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
end

function InventoryColumnUtil._jinit(self)
    InventoryColumnUtil._init_fields(self)
    return self
end

function InventoryColumnUtil.new()
    return InventoryColumnUtil._jinit(setmetatable({}, InventoryColumnUtil))
end


function InventoryColumnUtil.getInstance()
        return InventoryColumnUtil.instance_f
end


function InventoryColumnUtil:getColumnWhereLike(inventoryEntity, category, column)
        self.logUtil:putF(require("allbinary_java").to_string("Start Category: ") .. require("allbinary_java").to_string(category), self, "getKeywords")
        local keywords = BasicArrayListD.new()
        local vectorOfHashMaps = inventoryEntity:getAllRows()
        local size = vectorOfHashMaps:size()
        for index = 0, size - 1 do
            local hashMap = vectorOfHashMaps:get(index)
            local categoryName = hashMap:get(self.basicItemData.CATEGORY)
            if not (StringValidationUtil.getInstance():isEmpty(categoryName)) and (string.sub(categoryName, 1, #category) == category) then
                keywords:add(hashMap:get(column))
            end
        end
        return keywords
end

InventoryColumnUtil.instance_f = InventoryColumnUtil.new()

return InventoryColumnUtil

