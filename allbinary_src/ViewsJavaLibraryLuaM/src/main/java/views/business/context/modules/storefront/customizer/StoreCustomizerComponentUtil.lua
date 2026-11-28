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
-- package views.business.context.modules.storefront.customizer

local StoreCustomizerComponentUtil = {}
package.loaded["views.business.context.modules.storefront.customizer.StoreCustomizerComponentUtil"] = StoreCustomizerComponentUtil

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
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformGeneratorUtil = java_lazy("org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil")
local TransformInfo = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CustomizerUtil = java_lazy("views.business.context.modules.storefront.customizer.CustomizerUtil")

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

-- class table StoreCustomizerComponentUtil is declared before the requires
StoreCustomizerComponentUtil.__index = StoreCustomizerComponentUtil
StoreCustomizerComponentUtil.className = "StoreCustomizerComponentUtil"
StoreCustomizerComponentUtil.javaClassName = "views.business.context.modules.storefront.customizer.StoreCustomizerComponentUtil"

function StoreCustomizerComponentUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StoreCustomizerComponentUtil.getInstance()
        return StoreCustomizerComponentUtil.instance_f
end


function StoreCustomizerComponentUtil._jinit(self)
    StoreCustomizerComponentUtil._init_fields(self)
    return self
end

function StoreCustomizerComponentUtil.new(...)
    local self = setmetatable({}, StoreCustomizerComponentUtil)
    StoreCustomizerComponentUtil._jinit(self, ...)
    return self
end


-- throws Exception
function StoreCustomizerComponentUtil:generate_j2(abeClientInformation, transformInfoInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Generating Modified Views For: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "generateModifiedViews()")
        end
        local customizerUtil = CustomizerUtil.getInstance()
        local allCustomizedViews = customizerUtil:getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface)
        local size = allCustomizedViews:size()
        for index = 0, size - 1 do
            local nextTransformInfoInterface = allCustomizedViews:get(index)
            local allViewsToBeModified = customizerUtil:getTransformInfoObjectConfigComponentNodesToCustomize(transformInfoInterface, nextTransformInfoInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("View or component that was modified by a Customizer: ") .. require("allbinary_java").to_string(nextTransformInfoInterface:getName()), self, "generateModifiedViews()")
            end
            self:generate(abeClientInformation, transformInfoInterface, allViewsToBeModified)
        end
        return StringUtil.getInstance().EMPTY_STRING
end


-- throws Exception
function StoreCustomizerComponentUtil:generate_j3(abeClientInformation, transformInfoInterface, allViewsToBeModifiedVector)
        local customizerUtil = CustomizerUtil.getInstance()
        local size = allViewsToBeModifiedVector:size()
        for index = 0, size - 1 do
            local nextTransformInfoInterface = allViewsToBeModifiedVector:get(index)
            local specifiedTransformInfoInterface = customizerUtil:getTransformInfoInterfaceToCustomize(transformInfoInterface, nextTransformInfoInterface)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Retrieved: ") .. require("allbinary_java").to_string(specifiedTransformInfoInterface:getName()), self, "generateModifiedViews()")
            end
            TransformGeneratorUtil.getInstance():generate(abeClientInformation, nextTransformInfoInterface, specifiedTransformInfoInterface)
        end
end
function StoreCustomizerComponentUtil:generate(...)
    local count = select("#", ...)
    if count == 2 then return self:generate_j2(...) end
    if count == 3 then return self:generate_j3(...) end
    error("No method generate takes " .. count .. " arguments")
end
StoreCustomizerComponentUtil.generate__jdispatcher = StoreCustomizerComponentUtil.generate

StoreCustomizerComponentUtil.instance_f = StoreCustomizerComponentUtil.new()

return StoreCustomizerComponentUtil

