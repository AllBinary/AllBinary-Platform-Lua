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
-- package org.allbinary.input.automation.module.actions.script.condition.processors.output

local ImageActionScriptOutput = {}
package.loaded["org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput"] = ImageActionScriptOutput

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
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local BasicProfileActionScriptOutput = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.BasicProfileActionScriptOutput")
local ImageActionScriptOutputInterface = require("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputInterface")
local ImageActionScriptOutputData = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputData")
local ImageActionScriptOutputJPanel = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputJPanel")
local ImageActionScriptOutputProcessor = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutputProcessor")
local ImageTypes = java_lazy("org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageTypes")

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

-- class table ImageActionScriptOutput is declared before the requires
ImageActionScriptOutput.__index = ImageActionScriptOutput
ImageActionScriptOutput.className = "ImageActionScriptOutput"
ImageActionScriptOutput.javaClassName = "org.allbinary.input.automation.module.actions.script.condition.processors.output.ImageActionScriptOutput"
setmetatable(ImageActionScriptOutput, {__index = BasicProfileActionScriptOutput})
ImageActionScriptOutput.java_implements = " ImageActionScriptOutputInterface "
ImageActionScriptOutput.java_interfaces = function() return {ImageActionScriptOutputInterface} end

function ImageActionScriptOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.saved = false
    self.display = false
    if self.imageTypes == nil then self.imageTypes = nil end
    if self.actionScriptOutputJPanel == nil then self.actionScriptOutputJPanel = nil end
end

function ImageActionScriptOutput._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return ImageActionScriptOutput._new1(self, ...)
    elseif count == 0 then return ImageActionScriptOutput._new0(self, ...)
    end
    error("No constructor of ImageActionScriptOutput takes " .. count .. " arguments")
end

function ImageActionScriptOutput.new(...)
    local self = setmetatable({}, ImageActionScriptOutput)
    ImageActionScriptOutput._jinit(self, ...)
    return self
end


function ImageActionScriptOutput._new1(self, node)
    java_super_init(BasicProfileActionScriptOutput, self, ImageActionScriptOutput.NAME, node)
    ImageActionScriptOutput._init_fields(self)
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        local actionNode = DomSearchHelper.getNode(ImageActionScriptOutputData.NAME, node:getChildNodes())
        if not rawequal(actionNode, nil) then
            local nodeList = actionNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                local childNode = nodeList:item(index)
                if rawequal(childNode:getNodeName():compareTo(ImageActionScriptOutputData.SAVE), 0) then
                    local booleanString = DomNodeHelper.getTextNodeValue(childNode)
                    self:setSaved(booleanString)
                elseif rawequal(childNode:getNodeName():compareTo(ImageActionScriptOutputData.DISPLAY), 0) then
                    local booleanString = DomNodeHelper.getTextNodeValue(childNode)
                    self:setSaved(booleanString)
                elseif rawequal(childNode:getNodeName():compareTo(ImageActionScriptOutputData.TYPES), 0) then
                    self:setImageTypes(ImageTypes.new(childNode))
                else
                    error(require("java.lang.Exception").new("Action Script Output Unknown Node"), 0)
                end
            end
        else
            error(require("java.lang.Exception").new("Action Script Output Node Null"), 0)
        end
        self:setAllowsChildren(false)
        self.actionScriptOutputJPanel = ImageActionScriptOutputJPanel.new(self)
    return self
end


function ImageActionScriptOutput._new0(self)
    java_super_init(BasicProfileActionScriptOutput, self, ImageActionScriptOutput.NAME)
    ImageActionScriptOutput._init_fields(self)
        -- super(...) made self above
        self:setImageTypes(ImageTypes.new())
        self:setAllowsChildren(false)
        self.actionScriptOutputJPanel = ImageActionScriptOutputJPanel.new(self)
    return self
end


function ImageActionScriptOutput:getActionScriptOutputJPanel()
        return self.actionScriptOutputJPanel
end
java_overload(ImageActionScriptOutput, "getActionScriptOutputJPanel", 0)


function ImageActionScriptOutput:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(ImageActionScriptOutputData.DISPLAY, tostring(self:isDisplay()))
        hashMap:put(ImageActionScriptOutputData.SAVE, tostring(self:isSaved()))
        self.logUtil:putF(require("allbinary_java").to_string("HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toHashMap()")
        return hashMap
end
java_overload(ImageActionScriptOutput, "toHashMap", 0)


-- throws Exception
function ImageActionScriptOutput:toXmlNode(document)
        local node = java_super(BasicProfileActionScriptOutput, "toXmlNode", 1)(self, document)
        local newNode = ModDomHelper.createNodeWithValueNodes(document, ImageActionScriptOutputData.NAME, self:toHashMap())
        newNode:appendChild(self:getImageTypes():toXmlNode(document))
        node:appendChild(newNode)
        return node
end
java_overload(ImageActionScriptOutput, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function ImageActionScriptOutput:process(frame)
        ImageActionScriptOutputProcessor.process(self, frame)
end
java_overload(ImageActionScriptOutput, "process", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function ImageActionScriptOutput:showDialog()
        self.actionScriptOutputJPanel:getCapturedImageActionJDialog():setVisible(true)
end
java_overload(ImageActionScriptOutput, "showDialog", 0)


function ImageActionScriptOutput:isSaved()
        return self.saved
end
java_overload(ImageActionScriptOutput, "isSaved", 0)


function ImageActionScriptOutput:setSaved(saved)
        self.saved = saved
end
java_overload(ImageActionScriptOutput, "setSaved", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function ImageActionScriptOutput:isDisplay()
        return self.display
end
java_overload(ImageActionScriptOutput, "isDisplay", 0)


function ImageActionScriptOutput:setDisplay(display)
        self.display = display
end
java_overload(ImageActionScriptOutput, "setDisplay", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function ImageActionScriptOutput:future_toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(" Is Save: ")
        stringBuffer:appendboolean(self:isSaved())
        stringBuffer:append(" Is Display: ")
        stringBuffer:appendboolean(self:isDisplay())
        stringBuffer:append(" ")
        stringBuffer:append(tostring(self:getImageTypes()))
        return tostring(stringBuffer)
end
java_overload(ImageActionScriptOutput, "future_toString", 0)


function ImageActionScriptOutput:log()
        self.logUtil:putF(self:future_toString(), self, "log")
end
java_overload(ImageActionScriptOutput, "log", 0)


function ImageActionScriptOutput:getImageTypes()
        return self.imageTypes
end
java_overload(ImageActionScriptOutput, "getImageTypes", 0)


function ImageActionScriptOutput:setImageTypes(imageTypes)
        self.imageTypes = imageTypes
end
java_overload(ImageActionScriptOutput, "setImageTypes", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ImageTypes")) end)

ImageActionScriptOutput.NAME = "Captures"

return ImageActionScriptOutput

