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
-- package org.allbinary.game.identification

local CompositeGroup = {}
package.loaded["org.allbinary.game.identification.CompositeGroup"] = CompositeGroup

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GroupCommonFactory = java_lazy("org.allbinary.game.identification.GroupCommonFactory")

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

-- class table CompositeGroup is declared before the requires
CompositeGroup.__index = CompositeGroup
CompositeGroup.className = "CompositeGroup"
CompositeGroup.javaClassName = "org.allbinary.game.identification.CompositeGroup"

function CompositeGroup:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.groupInterface == nil then self.groupInterface = nil end
    self.list = BasicArrayListD.new()
end


function CompositeGroup._jinit(self, groupInterface)
    CompositeGroup._init_fields(self)
        self.groupInterface = groupInterface
    return self
end

function CompositeGroup.new(...)
    local self = setmetatable({}, CompositeGroup)
    CompositeGroup._jinit(self, ...)
    return self
end


function CompositeGroup:clear()
        self.list:clear()
end


function CompositeGroup:add(groupInterface)
        local commonStrings = CommonStrings.getInstance()
        local groupCommonFactory = GroupCommonFactory.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(groupCommonFactory.ADDING_LABEL)
        stringBuffer:append(tostring(groupInterface))
        stringBuffer:append(groupCommonFactory.TO_LABEL)
        stringBuffer:append(StringUtil.getInstance():toString(self.groupInterface))
        self.logUtil:putF(tostring(stringBuffer), self, commonStrings.ADD)
        self.list:add(groupInterface)
end


function CompositeGroup:isInGroup(groupInterface)
        if self.list:contains(groupInterface) then
            return true
        else
            return false
        end
end


function CompositeGroup:getGroup()
        return self.groupInterface
end

return CompositeGroup

