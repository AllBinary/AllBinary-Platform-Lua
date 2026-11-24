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

local InventorySearchLoopInfo = {}
package.loaded["views.generic.inventory.InventorySearchLoopInfo"] = InventorySearchLoopInfo

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table InventorySearchLoopInfo is declared before the requires
InventorySearchLoopInfo.__index = InventorySearchLoopInfo
InventorySearchLoopInfo.className = "InventorySearchLoopInfo"
InventorySearchLoopInfo.javaClassName = "views.generic.inventory.InventorySearchLoopInfo"

function InventorySearchLoopInfo:_init_fields()
    self.lastPage = -1
    self.currentPage = -1
    self.numberOfResultsOnCurrentPage = 0
    self.numberOfResults = 0
    self.CURRENT = "current: "
    self.NUM = " num: "
    self.LAST = " last: "
end

function InventorySearchLoopInfo._jinit(self)
    InventorySearchLoopInfo._init_fields(self)
    return self
end

function InventorySearchLoopInfo.new()
    return InventorySearchLoopInfo._jinit(setmetatable({}, InventorySearchLoopInfo))
end


function InventorySearchLoopInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.CURRENT)
        stringBuffer:appendint(self.currentPage)
        stringBuffer:append(self.NUM)
        stringBuffer:appendint(self.numberOfResults)
        stringBuffer:append(self.LAST)
        stringBuffer:appendint(self.lastPage)
        return tostring(stringBuffer)
end
InventorySearchLoopInfo.__tostring = function(self) return self:toString() end

return InventorySearchLoopInfo

