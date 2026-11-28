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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local TransformInfoObjectConfigNoManipulationFactory = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigNoManipulationFactory"] = TransformInfoObjectConfigNoManipulationFactory

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

local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoObjectConfig = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table TransformInfoObjectConfigNoManipulationFactory is declared before the requires
TransformInfoObjectConfigNoManipulationFactory.__index = TransformInfoObjectConfigNoManipulationFactory
TransformInfoObjectConfigNoManipulationFactory.className = "TransformInfoObjectConfigNoManipulationFactory"
TransformInfoObjectConfigNoManipulationFactory.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigNoManipulationFactory"

function TransformInfoObjectConfigNoManipulationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoObjectConfigNoManipulationFactory.getInstance()
        return TransformInfoObjectConfigNoManipulationFactory.instance_f
end
TransformInfoObjectConfigNoManipulationFactory.getInstance__static = TransformInfoObjectConfigNoManipulationFactory.getInstance


function TransformInfoObjectConfigNoManipulationFactory._jinit(self)
    TransformInfoObjectConfigNoManipulationFactory._init_fields(self)
    return self
end

function TransformInfoObjectConfigNoManipulationFactory.new(...)
    local self = setmetatable({}, TransformInfoObjectConfigNoManipulationFactory)
    TransformInfoObjectConfigNoManipulationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function TransformInfoObjectConfigNoManipulationFactory:getInstance(transformInfoInterface, objectConfigFileAbPath)
        local try_ok, try_error, try_value = pcall(function()
            local transformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance()
            local data = CryptFileReader.new(transformInfoObjectConfigData.UNCRYPTED_EXTENSION, transformInfoObjectConfigData:getInstance().ENCRYPTED_EXTENSION):get(objectConfigFileAbPath)
            do return "__jreturn", TransformInfoObjectConfig.new(transformInfoInterface, DomDocumentHelper.create(data)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Could Not Load Object Config", self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
TransformInfoObjectConfigNoManipulationFactory.getInstance__instance = TransformInfoObjectConfigNoManipulationFactory.getInstance
function TransformInfoObjectConfigNoManipulationFactory.getInstance(...)
                
    if select("#", ...) == 0 then return TransformInfoObjectConfigNoManipulationFactory.getInstance__static() end
                
    return TransformInfoObjectConfigNoManipulationFactory.getInstance__instance(...)
                
end

TransformInfoObjectConfigNoManipulationFactory.instance_f = TransformInfoObjectConfigNoManipulationFactory.new()

return TransformInfoObjectConfigNoManipulationFactory

