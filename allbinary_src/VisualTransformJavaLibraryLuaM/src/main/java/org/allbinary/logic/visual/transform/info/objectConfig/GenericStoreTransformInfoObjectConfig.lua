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

local GenericStoreTransformInfoObjectConfig = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig"] = GenericStoreTransformInfoObjectConfig

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
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local RootTransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.RootTransformInfoData")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoHttp = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttp")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformTemplateFactory = java_lazy("org.allbinary.logic.visual.transform.template.TransformTemplateFactory")
local TransformTemplateInterface = java_lazy("org.allbinary.logic.visual.transform.template.TransformTemplateInterface")
local TransformTemplateCustomizerUtil = java_lazy("org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table GenericStoreTransformInfoObjectConfig is declared before the requires
GenericStoreTransformInfoObjectConfig.__index = GenericStoreTransformInfoObjectConfig
GenericStoreTransformInfoObjectConfig.className = "GenericStoreTransformInfoObjectConfig"
GenericStoreTransformInfoObjectConfig.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig"
setmetatable(GenericStoreTransformInfoObjectConfig, {__index = TransformInfoObjectConfig})

function GenericStoreTransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
end

function GenericStoreTransformInfoObjectConfig._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return GenericStoreTransformInfoObjectConfig._new2(self, ...)
    elseif count == 3 then return GenericStoreTransformInfoObjectConfig._new3(self, ...)
    elseif count == 4 then return GenericStoreTransformInfoObjectConfig._new4(self, ...)
    end
    error("No constructor of GenericStoreTransformInfoObjectConfig takes " .. count .. " arguments")
end

function GenericStoreTransformInfoObjectConfig.new(...)
    local self = setmetatable({}, GenericStoreTransformInfoObjectConfig)
    GenericStoreTransformInfoObjectConfig._jinit(self, ...)
    return self
end


function GenericStoreTransformInfoObjectConfig._new2(self, abeClientInformation, transformInfoInterface)
    java_super_init(TransformInfoObjectConfig, self, transformInfoInterface)
    GenericStoreTransformInfoObjectConfig._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
    return self
end


function GenericStoreTransformInfoObjectConfig._new3(self, abeClientInformation, transformInfoInterface, document)
    java_super_init(TransformInfoObjectConfig, self, transformInfoInterface, document)
    GenericStoreTransformInfoObjectConfig._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function GenericStoreTransformInfoObjectConfig._new4(self, abeClientInformation, transformInfoInterface, name, type)
    java_super_init(TransformInfoObjectConfig, self, transformInfoInterface, name, type)
    GenericStoreTransformInfoObjectConfig._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function GenericStoreTransformInfoObjectConfig:generate_j1(objectConfigDocument)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if self:getTransformInfoInterface() ~= nil then
                stringBuffer:append(self:getTransformInfoInterface():getName())
            else
                stringBuffer:append("No Owner!?#@")
            end
            self.logUtil:putF(tostring(stringBuffer), self, "generate()")
        end
        local transformInfoHttpStoreInterface = self:getTransformInfoInterface()
        local objectConfigDocumentString = XmlDocumentHelper.toString(objectConfigDocument)
        local replaceHashMap = self:createReplaceHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        return self:generate(objectConfigDocumentString, replaceHashMap)
end


-- throws Exception
function GenericStoreTransformInfoObjectConfig:createReplaceHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        local storeName = transformInfoHttpStoreInterface:getStoreName()
        local hashMap = self:createHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        local transformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance()
        hashMap:put(transformInfoObjectConfigData.VARKEY + StoreFrontData.getInstance().NAME, storeName)
        local pageName = TransformTemplateCustomizerUtil.getInstance():getPageNameHack(self:getTransformInfoInterface():getName(), storeName)
        hashMap:put(transformInfoObjectConfigData.VARKEY + TransformInfoData.getInstance().PARTIAL, pageName)
        return hashMap
end
java_overload(GenericStoreTransformInfoObjectConfig, "createReplaceHashMap", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "TransformInfoHttp")) and (java_a2 == nil or type(java_a2) == "string") end)


-- throws Exception
function GenericStoreTransformInfoObjectConfig:createHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        local hashMap = StdUtil.getInstance():createHashMap()
        local storeName = transformInfoHttpStoreInterface:getStoreName()
        local propertiesHashMap = transformInfoHttpStoreInterface:getPropertiesHashMap()
        local templateNameOverride = StringUtil.getInstance():getNonNull(propertiesHashMap:get(TransformInfoData.getInstance().PARTIAL))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("TemplateNameOverride: " .. templateNameOverride, self, "generate()")
        end
        local templateNameStringBuffer = StringMaker.new()
        templateNameStringBuffer:append(storeName)
        templateNameStringBuffer:append(templateNameOverride)
        templateNameStringBuffer:append(CommonSeps.getInstance().SPACE)
        templateNameStringBuffer:append(RootTransformInfoData.NAME)
        local templateNameKey = TransformInfoObjectConfigData.getInstance().VARKEY + TransformInfoData.getInstance().OWNER
        if ((string.find(objectConfigDocumentString, templateNameKey, 1, true) or 0) - 1) ~= -1 then
            local templateInterface = TransformTemplateFactory.getInstance():getInstance(self.abeClientInformation, tostring(templateNameStringBuffer), transformInfoHttpStoreInterface:getPropertiesHashMap(), transformInfoHttpStoreInterface:getPageContext())
            local selectedTemplate = templateInterface:getName()
            hashMap:put(templateNameKey, selectedTemplate)
        end
        return hashMap
end
java_overload(GenericStoreTransformInfoObjectConfig, "createHashMap", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "TransformInfoHttp")) and (java_a2 == nil or type(java_a2) == "string") end)


-- throws Exception
function GenericStoreTransformInfoObjectConfig:generate_j2(objectConfigDocumentString, hashMap)
        local replace = Replace.new(hashMap)
        local newObjectConfigDocument = DomDocumentHelper.create(replace:all(objectConfigDocumentString))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Final ObjectConfig: " .. XmlDocumentHelper.toString(newObjectConfigDocument), self, "generate()")
        end
        return newObjectConfigDocument
end
function GenericStoreTransformInfoObjectConfig:generate(...)
    local count = select("#", ...)
    if count == 1 then return self:generate_j1(...) end
    if count == 2 then return self:generate_j2(...) end
    error("No method generate takes " .. count .. " arguments")
end
GenericStoreTransformInfoObjectConfig.generate__jdispatcher = GenericStoreTransformInfoObjectConfig.generate

return GenericStoreTransformInfoObjectConfig

