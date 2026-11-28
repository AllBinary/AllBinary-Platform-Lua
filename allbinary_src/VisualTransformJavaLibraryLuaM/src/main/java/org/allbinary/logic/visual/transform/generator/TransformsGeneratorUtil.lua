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

local TransformsGeneratorUtil = {}
package.loaded["org.allbinary.logic.visual.transform.generator.TransformsGeneratorUtil"] = TransformsGeneratorUtil

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoDomNode = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformGeneratorUtil = java_lazy("org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table TransformsGeneratorUtil is declared before the requires
TransformsGeneratorUtil.__index = TransformsGeneratorUtil
TransformsGeneratorUtil.className = "TransformsGeneratorUtil"
TransformsGeneratorUtil.javaClassName = "org.allbinary.logic.visual.transform.generator.TransformsGeneratorUtil"

function TransformsGeneratorUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformsGeneratorUtil.getInstance()
        return TransformsGeneratorUtil.instance_f
end


function TransformsGeneratorUtil._jinit(self)
    TransformsGeneratorUtil._init_fields(self)
    return self
end

function TransformsGeneratorUtil.new(...)
    local self = setmetatable({}, TransformsGeneratorUtil)
    TransformsGeneratorUtil._jinit(self, ...)
    return self
end


-- throws Exception
function TransformsGeneratorUtil:generateComponentsFromObjectConfig_j3(abeClientInformation, transformInfoInterface, group)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Started Group: ") .. require("allbinary_java").to_string(group), self, "generateComponentsFromObjectConfig(2)")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        local result = self:generateComponentsFromObjectConfig(abeClientInformation, transformInfoObjectConfigInterface, transformInfoInterface, group)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("End Group: ") .. require("allbinary_java").to_string(group), self, "generateComponentsFromObjectConfig(2)")
        end
        return result
end


-- throws Exception
function TransformsGeneratorUtil:generateComponentsFromObjectConfig_j4(abeClientInformation, transformInfoObjectConfigInterface, transformInfoInterface, group)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Started Group: ") .. require("allbinary_java").to_string(group), self, "generateComponentsFromObjectConfig()")
        end
        local transformInfoObjectConfigComponentVector = transformInfoObjectConfigInterface:getTransformsGroup(group)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Processing ")
            stringBuffer:appendint(transformInfoObjectConfigComponentVector:size())
            stringBuffer:append(" Components Group: ")
            stringBuffer:append(group)
            self.logUtil:putF(tostring(stringBuffer), self, "generateComponentsFromObjectConfig()")
        end
        if transformInfoObjectConfigComponentVector:size() < 1 then
            error(require("java.lang.Exception").new("No Pages Generated For Template."), 0)
        end
        local size = transformInfoObjectConfigComponentVector:size()
        for index = 0, size - 1 do
            local transformInfoObjectConfigComponent = transformInfoObjectConfigComponentVector:get(index)
            TransformGeneratorUtil.getInstance():generate(abeClientInformation, transformInfoObjectConfigComponent, transformInfoInterface)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Done Group: ") .. require("allbinary_java").to_string(group), self, "generateComponentsFromObjectConfig()")
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append("<!-- Generated all template views successfully for View: ")
        stringBuffer:append(transformInfoInterface:getName())
        stringBuffer:append("-->")
        return tostring(stringBuffer)
end
function TransformsGeneratorUtil:generateComponentsFromObjectConfig(...)
    local count = select("#", ...)
    if count == 3 then return self:generateComponentsFromObjectConfig_j3(...) end
    if count == 4 then return self:generateComponentsFromObjectConfig_j4(...) end
    error("No method generateComponentsFromObjectConfig takes " .. count .. " arguments")
end
TransformsGeneratorUtil.generateComponentsFromObjectConfig__jdispatcher = TransformsGeneratorUtil.generateComponentsFromObjectConfig

TransformsGeneratorUtil.instance_f = TransformsGeneratorUtil.new()

return TransformsGeneratorUtil

