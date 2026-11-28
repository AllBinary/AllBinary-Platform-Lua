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
-- package org.allbinary.logic.visual.dhtml.style

local StylesValidationFactory = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.StylesValidationFactory"] = StylesValidationFactory

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
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local NameSpaceRequestParamData = java_lazy("org.allbinary.logic.communication.http.request.NameSpaceRequestParamData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CssElementData = java_lazy("org.allbinary.logic.visual.dhtml.style.css.CssElementData")
local CssElementsValidationFactory = java_lazy("org.allbinary.logic.visual.dhtml.style.css.CssElementsValidationFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StyleData = java_lazy("org.allbinary.logic.visual.dhtml.style.StyleData")
local StylesData = java_lazy("org.allbinary.logic.visual.dhtml.style.StylesData")

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

-- class table StylesValidationFactory is declared before the requires
StylesValidationFactory.__index = StylesValidationFactory
StylesValidationFactory.className = "StylesValidationFactory"
StylesValidationFactory.javaClassName = "org.allbinary.logic.visual.dhtml.style.StylesValidationFactory"

function StylesValidationFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StylesValidationFactory.getInstance_j0()
        return StylesValidationFactory.instance_f
end


function StylesValidationFactory._jinit(self)
    StylesValidationFactory._init_fields(self)
    return self
end

function StylesValidationFactory.new(...)
    local self = setmetatable({}, StylesValidationFactory)
    StylesValidationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function StylesValidationFactory:getInstance(document)
        local commonStrings = CommonStrings.getInstance()
        local nodeList = document:getElementsByTagName(StylesData.getInstance().NAME)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Style Present: ") .. require("allbinary_java").to_string(XmlDocumentHelper.toString(document)), self, commonStrings.GET_INSTANCE)
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Styles Present: ") .. require("allbinary_java").to_string(nodeList:getLength()), self, commonStrings.GET_INSTANCE)
        end
        for index = 0, nodeList:getLength() - 1 do
            local stylesNode = nodeList:item(index)
            local styleNodeList = DomSearchHelper.getAllNodes(StyleData.getInstance().NAME, stylesNode:getChildNodes())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Number Of Style Nodes Present: ") .. require("allbinary_java").to_string(styleNodeList:size()), self, commonStrings.GET_INSTANCE)
            end
            for styleNodesIndex = 0, styleNodeList:size() - 1 do
                local styleNode = styleNodeList:get(styleNodesIndex)
                local cssElementStyleNodeList = DomSearchHelper.getAllNodes(CssElementData.getInstance().NAME, styleNode:getChildNodes())
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF(require("allbinary_java").to_string("Number Of Element Nodes Present: ") .. require("allbinary_java").to_string(cssElementStyleNodeList:size()), self, commonStrings.GET_INSTANCE)
                end
                return CssElementsValidationFactory.getInstance(cssElementStyleNodeList)
            end
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("No Style Present", self, commonStrings.GET_INSTANCE)
        end
        return BasicArrayListD.new()
end


-- throws Exception
function StylesValidationFactory.getInstance_j1(hashMap)
        local stylesDocument = hashMap:get(NameSpaceRequestParamData.DOCUMENT)
        return StylesValidationFactory.getInstance_j0():getInstance(stylesDocument)
end
function StylesValidationFactory.getInstance(...)
    local count = select("#", ...)
    if count == 0 then return StylesValidationFactory.getInstance_j0(...) end
    if count == 1 then return StylesValidationFactory.getInstance_j1(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
StylesValidationFactory.getInstance__jdispatcher = StylesValidationFactory.getInstance

StylesValidationFactory.instance_f = StylesValidationFactory.new()

return StylesValidationFactory

