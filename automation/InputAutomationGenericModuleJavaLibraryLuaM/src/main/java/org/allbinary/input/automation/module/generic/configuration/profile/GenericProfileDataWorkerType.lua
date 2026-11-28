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
-- package org.allbinary.input.automation.module.generic.configuration.profile

local GenericProfileDataWorkerType = {}
package.loaded["org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType"] = GenericProfileDataWorkerType

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
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local InputImageType = java_lazy("org.allbinary.input.media.image.InputImageType")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local GenericProfileDataWorkerTypeInterface = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerTypeInterface")
local GenericProfileDataWorkerData = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerData")
local SavedCaptureGenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType")

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

-- class table GenericProfileDataWorkerType is declared before the requires
GenericProfileDataWorkerType.__index = GenericProfileDataWorkerType
GenericProfileDataWorkerType.className = "GenericProfileDataWorkerType"
GenericProfileDataWorkerType.javaClassName = "org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType"
GenericProfileDataWorkerType.java_implements = " GenericProfileDataWorkerTypeInterface "
GenericProfileDataWorkerType.java_interfaces = function() return {GenericProfileDataWorkerTypeInterface} end

function GenericProfileDataWorkerType:_init_fields()
    if self.name_f == nil then self.name_f = nil end
end


function GenericProfileDataWorkerType._jinit(self, name)
    GenericProfileDataWorkerType._init_fields(self)
        self:setName(name)
        GenericProfileDataWorkerType.hashMap:put(self:getName(), self)
    return self
end

function GenericProfileDataWorkerType.new(...)
    local self = setmetatable({}, GenericProfileDataWorkerType)
    GenericProfileDataWorkerType._jinit(self, ...)
    return self
end


function GenericProfileDataWorkerType:getName()
        return self.name_f
end


function GenericProfileDataWorkerType:setName(name)
        self.name_f = name
end


-- throws Exception
function GenericProfileDataWorkerType:toXmlNode(document)
        local node = ModDomHelper.createTextNode(document, GenericProfileDataWorkerData.NAME, self.name_f)
        return node
end


function GenericProfileDataWorkerType:toString()
        return require("allbinary_java").to_string("GenericProfileDataWorkerType: ") .. require("allbinary_java").to_string(self:getName())
end
GenericProfileDataWorkerType.__tostring = function(self) return self:toString() end


function GenericProfileDataWorkerType.getInstance(node)
        local name = DomNodeHelper.getTextNodeValue(node)
        return GenericProfileDataWorkerType.hashMap:get(name)
end

GenericProfileDataWorkerType.hashMap = StdUtil.getInstance():createHashMap()
GenericProfileDataWorkerType.SAVED_CAPTURE = SavedCaptureGenericProfileDataWorkerType.SAVED_CAPTURE
GenericProfileDataWorkerType.SCREEN_CAPTURE = GenericProfileDataWorkerType.new(require("allbinary_java").to_string("Screen ") .. require("allbinary_java").to_string(InputImageType.CAPTURE:getName()))
GenericProfileDataWorkerType.COMPARISON = GenericProfileDataWorkerType.new(InputImageType.COMPARISON:getName())
GenericProfileDataWorkerType.MOTION = GenericProfileDataWorkerType.new(InputImageType.MOTION:getName())

return GenericProfileDataWorkerType

