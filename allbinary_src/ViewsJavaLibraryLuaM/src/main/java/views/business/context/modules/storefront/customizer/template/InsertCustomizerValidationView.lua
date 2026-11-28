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
-- package views.business.context.modules.storefront.customizer.template

local InsertCustomizerValidationView = {}
package.loaded["views.business.context.modules.storefront.customizer.template.InsertCustomizerValidationView"] = InsertCustomizerValidationView

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
local TransformInfoEntityBuilder = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local RequestParams = java_lazy("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformFactory = java_lazy("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = java_lazy("org.allbinary.logic.visual.transform.TransformInterface")
local GeneratorTransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.GeneratorTransformInfoData")
local TransformInfo = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfosData")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")
local InsertTemplateCustomizerTransformInfoObjectConfig = java_lazy("views.business.context.modules.storefront.customizer.template.objectConfig.InsertTemplateCustomizerTransformInfoObjectConfig")
local NoTemplateTransformInfoObjectConfig = java_lazy("views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ValidationOnlyTempUtil = java_lazy("views.ValidationOnlyTempUtil")

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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

--Sets Template Type
-- class table InsertCustomizerValidationView is declared before the requires
InsertCustomizerValidationView.__index = InsertCustomizerValidationView
InsertCustomizerValidationView.className = "InsertCustomizerValidationView"
InsertCustomizerValidationView.javaClassName = "views.business.context.modules.storefront.customizer.template.InsertCustomizerValidationView"
setmetatable(InsertCustomizerValidationView, {__index = HttpStoreComponentView})
InsertCustomizerValidationView.java_implements = " ValidationComponentInterface "
InsertCustomizerValidationView.java_interfaces = function() return {ValidationComponentInterface} end

function InsertCustomizerValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.viewName == nil then self.viewName = nil end
end


function InsertCustomizerValidationView._jinit(self, transformInfoInterface)
    java_super_init(HttpStoreComponentView, self, transformInfoInterface)
    InsertCustomizerValidationView._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, self.commonStrings.CONSTRUCTOR)
        end
        local requestHashMap = RequestParams.new(self:getPageContext()):toHashMap()
        self.viewName = requestHashMap:get(TransformInfoData.getInstance().NAME)
    return self
end

function InsertCustomizerValidationView.new(...)
    local self = setmetatable({}, InsertCustomizerValidationView)
    InsertCustomizerValidationView._jinit(self, ...)
    return self
end


function InsertCustomizerValidationView:isValid()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Started Validation", self, self.commonStrings.IS_VALID)
            end
            local isValid = true
            if StringValidationUtil.getInstance():isEmpty(self.viewName) then
                isValid = false
            else
                local objectConfig = NoTemplateTransformInfoObjectConfig.new(self:getTransformInfoInterface(), self:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc())
                local componentVector = objectConfig:getGroupTransforms()
                local size = componentVector:size()
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Pointing ")
                    stringBuffer:appendint(componentVector:size())
                    stringBuffer:append(" Components")
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                for index = 0, size - 1 do
                    local transformInfo = componentVector:get(index)
                    local transformInfoName = transformInfo:getName()
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                        self.logUtil:putF(require("allbinary_java").to_string("Setting Template Component with ViewName: ") .. require("allbinary_java").to_string(transformInfoName), self, self.commonStrings.IS_VALID)
                    end
                    local componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, transformInfoName, self:getTransformInfoInterface())
                    local templateViewObjectConfig = InsertTemplateCustomizerTransformInfoObjectConfig.new(componentInterface:getTransformInfoInterface(), componentInterface:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc())
                    local storeName = self:getTransformInfoInterface():getStoreName()
                    local endIndex = ((string.find(self.viewName, storeName, 1, true) or 0) - 1) + #storeName
                    local storePrepend = string.sub(self.viewName, (0) + 1, endIndex)
                    local viewNamePostfix = string.sub(self.viewName, (endIndex) + 1, #self.viewName)
                    local newViewNameStringBuffer = StringMaker.new()
                    newViewNameStringBuffer:append(storePrepend)
                    local commonSeps = CommonSeps.getInstance()
                    local transformInfosData = TransformInfosData.getInstance()
                    if ((string.find(transformInfoName, transformInfosData.SMALL_PREVIEW, 1, true) or 0) - 1) >= 0 then
                        newViewNameStringBuffer:append(commonSeps.SPACE)
                        newViewNameStringBuffer:append(transformInfosData.SMALL_PREVIEW)
                    elseif ((string.find(transformInfoName, transformInfosData.PREVIEW, 1, true) or 0) - 1) >= 0 then
                        newViewNameStringBuffer:append(commonSeps.SPACE)
                        newViewNameStringBuffer:append(transformInfosData.PREVIEW)
                    end
                    newViewNameStringBuffer:append(commonSeps.SPACE)
                    newViewNameStringBuffer:append(viewNamePostfix)
                    if ((string.find(transformInfoName, GeneratorTransformInfoData.NAME, 1, true) or 0) - 1) >= 0 then
                        newViewNameStringBuffer:append(commonSeps.SPACE)
                        newViewNameStringBuffer:append(GeneratorTransformInfoData.NAME)
                    end
                    local newViewName = tostring(newViewNameStringBuffer)
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Template Component: ")
                        stringBuffer:append(transformInfoName)
                        stringBuffer:append("\n Now Pointing To View Name: ")
                        stringBuffer:append(newViewName)
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    templateViewObjectConfig:set(newViewName)
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Template Component: ")
                        stringBuffer:append(transformInfoName)
                        stringBuffer:append("\n with ObjectConfig: ")
                        stringBuffer:append(tostring(templateViewObjectConfig))
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    componentInterface:getTransformInfoInterface():setObjectConfigInterface(templateViewObjectConfig)
                    local updatedTransformInfoHashMap = componentInterface:getTransformInfoInterface():toHashMap()
                    TransformInfoEntityBuilder.getInstance():update(updatedTransformInfoHashMap)
                end
            end
            do return "__jreturn", isValid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InsertCustomizerValidationView, "isValid", 0)


function InsertCustomizerValidationView:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Error: Template Name Is Empty.")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(InsertCustomizerValidationView, "validationInfo", 0)


function InsertCustomizerValidationView:toValidationInfoDoc()
        return nil
end
java_overload(InsertCustomizerValidationView, "toValidationInfoDoc", 0)


function InsertCustomizerValidationView:toValidationInfoNode(document)
        return nil
end
java_overload(InsertCustomizerValidationView, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function InsertCustomizerValidationView:view()
        return ValidationOnlyTempUtil.getInstance():view(self)
end
java_overload(InsertCustomizerValidationView, "view", 0)


-- throws Exception
function InsertCustomizerValidationView:getTransformInfoInterface()
        return java_super(HttpStoreComponentView, "getTransformInfoInterface", 0)(self)
end
java_overload(InsertCustomizerValidationView, "getTransformInfoInterface", 0)

return InsertCustomizerValidationView

