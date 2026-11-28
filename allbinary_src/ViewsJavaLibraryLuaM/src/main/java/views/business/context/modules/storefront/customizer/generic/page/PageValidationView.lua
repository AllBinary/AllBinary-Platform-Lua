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
-- package views.business.context.modules.storefront.customizer.generic.page

local PageValidationView = {}
package.loaded["views.business.context.modules.storefront.customizer.generic.page.PageValidationView"] = PageValidationView

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
local TransformInfoEntity = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfo = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local PageValidation = java_lazy("org.allbinary.logic.visual.transform.template.customizer.page.PageValidation")
local TitleData = java_lazy("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local CustomizerUtil = java_lazy("views.business.context.modules.storefront.customizer.CustomizerUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local PageView = require("views.business.context.modules.storefront.customizer.generic.page.PageView")

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

-- class table PageValidationView is declared before the requires
PageValidationView.__index = PageValidationView
PageValidationView.className = "PageValidationView"
PageValidationView.javaClassName = "views.business.context.modules.storefront.customizer.generic.page.PageValidationView"
setmetatable(PageValidationView, {__index = PageView})
PageValidationView.java_implements = " ValidationComponentInterface "
PageValidationView.java_interfaces = function() return {ValidationComponentInterface} end

function PageValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PageValidationView._jinit(self, transformInfoInterface)
    java_super_init(PageView, self, transformInfoInterface)
    PageValidationView._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "PageViewValidation()")
        end
    return self
end

function PageValidationView.new(...)
    local self = setmetatable({}, PageValidationView)
    PageValidationView._jinit(self, ...)
    return self
end


function PageValidationView:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local isValid = true
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
            local pageObjectConfigInterface = self:getTransformInfoInterface():getObjectConfigInterface()
            local allViewsToBeModifiedVector = pageObjectConfigInterface:getGroupTransforms()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Views To Be Modified: ") .. require("allbinary_java").to_string(allViewsToBeModifiedVector:size()), self, "get(transformInfoInterface)")
            end
            local size = allViewsToBeModifiedVector:size()
            for index = 0, size - 1 do
                local transformInfoInterface = allViewsToBeModifiedVector:get(index)
                local viewNameOfViewToBeModified = transformInfoInterface:getName()
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self:getTransformInfoInterface():getName())
                    stringBuffer:append(" is modifying view: ")
                    stringBuffer:append(viewNameOfViewToBeModified)
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
                local httpTransformInfoInterface = self:getTransformInfoInterface()
                local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self:getTransformInfoInterface():getName())
                    stringBuffer:append(" is adding data to view: ")
                    stringBuffer:append(viewNameOfViewToBeModified)
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
                local hashMap = StdUtil.getInstance():createHashMap()
                local title = specifiedTransformInfoInterface:getName():substring(self:getTransformInfoInterface():getStoreName():length())
                if rawequal(((title < "index" and -1) or (title > "index" and 1) or 0), 0) then
                    hashMap:put(TitleData.getInstance().TEXT, require("allbinary_java").to_string(self:getTransformInfoInterface():getStoreName()) .. require("allbinary_java").to_string(" - Home Page"))
                else
                    hashMap:put(TitleData.getInstance().TEXT, require("allbinary_java").to_string(require("allbinary_java").to_string(self:getTransformInfoInterface():getStoreName()) .. require("allbinary_java").to_string(" -")) .. require("allbinary_java").to_string(title))
                end
                local pageValidation = PageValidation.new(hashMap)
                if rawequal(pageValidation:isValid(), false) then
                    isValid = false
                end
                if rawequal(isValid, true) then
                    local document = DomDocumentHelper.create()
                    document:appendChild(pageValidation:toXmlNode(document))
                    local documentString = XmlDocumentHelper.toString(document)
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append(viewNameOfViewToBeModified)
                        stringBuffer:append(" is changing data in ")
                        stringBuffer:append(tostring(specifiedTransformInfoInterface:getDataFilePath()))
                        stringBuffer:append(" to the following data:\n")
                        stringBuffer:append(documentString)
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    CustomizerUtil.getInstance():write(specifiedTransformInfoInterface, documentString)
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
java_overload(PageValidationView, "isValid", 0)


function PageValidationView:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
            local objectConfig = self:getTransformInfoInterface():getObjectConfigInterface()
            local httpTransformInfoInterface = self:getTransformInfoInterface()
            local allViewsToBeModifiedVector = objectConfig:getGroupTransforms()
            local size = allViewsToBeModifiedVector:size()
            for index = 0, size - 1 do
                local transformInfoInterface = allViewsToBeModifiedVector:get(index)
                local viewNameOfViewToBeModified = transformInfoInterface:getName()
                local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
                local hashMap = StdUtil.getInstance():createHashMap()
                local title = specifiedTransformInfoInterface:getName():substring(self:getTransformInfoInterface():getStoreName():length())
                if rawequal(((title < "index" and -1) or (title > "index" and 1) or 0), 0) then
                    hashMap:put(TitleData.getInstance().TEXT, require("allbinary_java").to_string(self:getTransformInfoInterface():getStoreName()) .. require("allbinary_java").to_string(" - Home Page"))
                else
                    hashMap:put(TitleData.getInstance().TEXT, require("allbinary_java").to_string(require("allbinary_java").to_string(self:getTransformInfoInterface():getStoreName()) .. require("allbinary_java").to_string(" -")) .. require("allbinary_java").to_string(title))
                end
                local pageValidation = PageValidation.new(hashMap)
                if rawequal(pageValidation:isValid(), false) then
                    stringBuffer:append(require("allbinary_java").to_string("TransformInfo Name for PageValidation:") .. require("allbinary_java").to_string(specifiedTransformInfoInterface:getName()))
                    stringBuffer:append(require("allbinary_java").to_string("PageValidation:") .. require("allbinary_java").to_string(hashMap))
                    stringBuffer:append(require("allbinary_java").to_string("PageValidation Info:") .. require("allbinary_java").to_string(pageValidation:validationInfo()))
                end
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "An auto generated page name was invalid."
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(PageValidationView, "validationInfo", 0)


function PageValidationView:toValidationInfoDoc()
        return nil
end
java_overload(PageValidationView, "toValidationInfoDoc", 0)


function PageValidationView:toValidationInfoNode(document)
        return nil
end
java_overload(PageValidationView, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function PageValidationView:getTransformInfoInterface()
        return java_super(PageView, "getTransformInfoInterface", 0)(self)
end
java_overload(PageValidationView, "getTransformInfoInterface", 0)

return PageValidationView

