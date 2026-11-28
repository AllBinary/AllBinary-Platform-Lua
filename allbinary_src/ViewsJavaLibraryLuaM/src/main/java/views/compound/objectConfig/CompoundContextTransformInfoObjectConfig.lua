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
-- package views.compound.objectConfig

local CompoundContextTransformInfoObjectConfig = {}
package.loaded["views.compound.objectConfig.CompoundContextTransformInfoObjectConfig"] = CompoundContextTransformInfoObjectConfig

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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local InputStream = java_lazy("java.io.InputStream")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DocumentToNode = java_lazy("org.allbinary.data.tree.dom.document.DocumentToNode")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Replace = java_lazy("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformFactory = java_lazy("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")
local RootTransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.RootTransformInfoData")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoDomNode = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local GenericStoreTransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
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

-- class table CompoundContextTransformInfoObjectConfig is declared before the requires
CompoundContextTransformInfoObjectConfig.__index = CompoundContextTransformInfoObjectConfig
CompoundContextTransformInfoObjectConfig.className = "CompoundContextTransformInfoObjectConfig"
CompoundContextTransformInfoObjectConfig.javaClassName = "views.compound.objectConfig.CompoundContextTransformInfoObjectConfig"
setmetatable(CompoundContextTransformInfoObjectConfig, {__index = GenericStoreTransformInfoObjectConfig})

function CompoundContextTransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CompoundContextTransformInfoObjectConfig._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return CompoundContextTransformInfoObjectConfig._new2(self, ...)
    elseif count == 3 then return CompoundContextTransformInfoObjectConfig._new3(self, ...)
    elseif count == 4 then return CompoundContextTransformInfoObjectConfig._new4(self, ...)
    end
    error("No constructor of CompoundContextTransformInfoObjectConfig takes " .. count .. " arguments")
end

function CompoundContextTransformInfoObjectConfig.new(...)
    local self = setmetatable({}, CompoundContextTransformInfoObjectConfig)
    CompoundContextTransformInfoObjectConfig._jinit(self, ...)
    return self
end


function CompoundContextTransformInfoObjectConfig._new2(self, abeClientInformation, transformInfoInterface)
    java_super_init(GenericStoreTransformInfoObjectConfig, self, abeClientInformation, transformInfoInterface)
    CompoundContextTransformInfoObjectConfig._init_fields(self)
        -- super(...) made self above
    return self
end


function CompoundContextTransformInfoObjectConfig._new3(self, abeClientInformation, transformInfoInterface, document)
    java_super_init(GenericStoreTransformInfoObjectConfig, self, abeClientInformation, transformInfoInterface, document)
    CompoundContextTransformInfoObjectConfig._init_fields(self)
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function CompoundContextTransformInfoObjectConfig._new4(self, abeClientInformation, transformInfoInterface, name, type)
    java_super_init(GenericStoreTransformInfoObjectConfig, self, abeClientInformation, transformInfoInterface, name, type)
    CompoundContextTransformInfoObjectConfig._init_fields(self)
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function CompoundContextTransformInfoObjectConfig:get()
        local storeName = self:getTransformInfoInterface():getStoreName()
        local httpTransformInfoInterface = self:getTransformInfoInterface()
        local templateNameOverride = StringUtil.getInstance():getNonNull(httpTransformInfoInterface:getPropertiesHashMap():get(TransformInfoData.getInstance().PARTIAL))
        local stringBuffer = StringMaker.new()
        stringBuffer:append(storeName)
        stringBuffer:append(templateNameOverride)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(RootTransformInfoData.NAME)
        local rootComponentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, tostring(stringBuffer), self:getTransformInfoInterface())
        local viewVector = self:getTransformDomNodes()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Root View Called with: ") .. require("allbinary_java").to_string(viewVector:size()), self, "get(transformInfoInterface)")
        end
        local rootView = rootComponentInterface:view()
        local startXMLHeader = "<xsl:text disable-output-escaping=\"yes\" ><![CDATA["
        local endXMLHeader = "]]></xsl:text>"
        local size = viewVector:size()
        for index = 0, size - 1 do
            local objectConfigTransformInfoDomNode = viewVector:get(index)
            local templateKey = objectConfigTransformInfoDomNode:getReplaceKey()
            local componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, objectConfigTransformInfoDomNode:getTransformInfoInterface():getName(), self:getTransformInfoInterface())
            local replacementViewString = componentInterface:view()
            replacementViewString = DocumentToNode.convertDocumentToNodeString(replacementViewString)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(startXMLHeader)
            stringBuffer:append(replacementViewString)
            stringBuffer:append(endXMLHeader)
            local templateValue = tostring(stringBuffer)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Replacing: ")
                stringBuffer:append(templateKey)
                stringBuffer:append(" with ")
                stringBuffer:append(templateValue)
                self.logUtil:putF(tostring(stringBuffer), self, "get()")
            end
            local replace = Replace.new(templateKey, templateValue)
            rootView = replace:all(rootView)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("End: Result of a compound view: ") .. require("allbinary_java").to_string(rootView), self, "get()")
        end
        return rootView
end
java_overload(CompoundContextTransformInfoObjectConfig, "get", 0)


-- throws Exception
function CompoundContextTransformInfoObjectConfig:createInputStream()
        local completeTemplateViewBytes = self:get():getBytes()
        local bais = ByteArrayInputStream.new(completeTemplateViewBytes)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Template: ") .. require("allbinary_java").to_string(tostring(string.char(table.unpack(completeTemplateViewBytes)))), self, "createInputStream()")
        end
        return bais
end
java_overload(CompoundContextTransformInfoObjectConfig, "createInputStream", 0)

return CompoundContextTransformInfoObjectConfig

