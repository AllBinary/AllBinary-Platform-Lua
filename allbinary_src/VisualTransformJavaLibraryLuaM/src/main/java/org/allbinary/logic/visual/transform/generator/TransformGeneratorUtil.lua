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
-- package org.allbinary.logic.visual.transform.generator

local TransformGeneratorUtil = {}
package.loaded["org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil"] = TransformGeneratorUtil

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
local InputOutputTypeData = java_lazy("org.allbinary.logic.io.InputOutputTypeData")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformFactory = java_lazy("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")
local TransformInfoDomNode = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local StoreFileGenerator = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.generator.StoreFileGenerator")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table TransformGeneratorUtil is declared before the requires
TransformGeneratorUtil.__index = TransformGeneratorUtil
TransformGeneratorUtil.className = "TransformGeneratorUtil"
TransformGeneratorUtil.javaClassName = "org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil"

function TransformGeneratorUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformGeneratorUtil.getInstance()
        return TransformGeneratorUtil.instance_f
end


function TransformGeneratorUtil._jinit(self)
    TransformGeneratorUtil._init_fields(self)
    return self
end

function TransformGeneratorUtil.new(...)
    local self = setmetatable({}, TransformGeneratorUtil)
    TransformGeneratorUtil._jinit(self, ...)
    return self
end


-- throws Exception
function TransformGeneratorUtil:generate_j3_1(abeClientInformation, transformInfoInterface, ownerTransformInfoInterface)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Generating View: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "generate()")
            end
            local componentInterface = TransformFactory.getInstance():getInstance(abeClientInformation, transformInfoInterface:getName(), ownerTransformInfoInterface)
            local result = componentInterface:view()
            local httpTransformInfoInterface = componentInterface:getTransformInfoInterface()
            local inputOutputTypeData = InputOutputTypeData.getInstance()
            if ((string.find(result, "<HTML>", 1, true) or 0) - 1) >= 0 then
                httpTransformInfoInterface:getPropertiesHashMap():put(inputOutputTypeData.NAME, inputOutputTypeData.DEFAULT)
            else
                httpTransformInfoInterface:getPropertiesHashMap():put(inputOutputTypeData.NAME, inputOutputTypeData.DEFAULT_FRAGMENT)
            end
            StoreFileGenerator.new(componentInterface:getTransformInfoInterface()):process(result)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate a view", self, "generate()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function TransformGeneratorUtil:generate_j3_2(abeClientInformation, transformInfoDomNode, ownerTransformInfoInterface)
        self:generate(abeClientInformation, transformInfoDomNode:getTransformInfoInterface(), ownerTransformInfoInterface)
end
function TransformGeneratorUtil:generate(...)
    local count = select("#", ...)
    if count == 3 then return self:generate_j3(...) end
    error("No method generate takes " .. count .. " arguments")
end
TransformGeneratorUtil.generate__jdispatcher = TransformGeneratorUtil.generate
function TransformGeneratorUtil:generate_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbeClientInformationInterface")) and (java_a2 == nil or java_is(java_a2, "TransformInfoInterface")) and (java_a3 == nil or java_is(java_a3, "TransformInfoInterface")) then return TransformGeneratorUtil.generate_j3_1(self, ...) end
    return TransformGeneratorUtil.generate_j3_2(self, ...)
end

TransformGeneratorUtil.instance_f = TransformGeneratorUtil.new()

return TransformGeneratorUtil

