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
-- package tags.transform.info

local TransformInfoTag = {}
package.loaded["tags.transform.info.TransformInfoTag"] = TransformInfoTag

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

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local TagHelperFactoryInterface = java_lazy("admin.taghelpers.TagHelperFactoryInterface")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local OutputTypeData = java_lazy("org.allbinary.logic.io.OutputTypeData")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoRequestHelperFactory = java_lazy("taghelpers.transform.info.TransformInfoRequestHelperFactory")
local ModifyTag = require("tags.ModifyTag")
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

-- class table TransformInfoTag is declared before the requires
TransformInfoTag.__index = TransformInfoTag
TransformInfoTag.className = "TransformInfoTag"
TransformInfoTag.javaClassName = "tags.transform.info.TransformInfoTag"
setmetatable(TransformInfoTag, {__index = ModifyTag})

function TransformInfoTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.objectFile == nil then self.objectFile = nil end
    if self.anyType == nil then self.anyType = nil end
    if self.objectConfigFile == nil then self.objectConfigFile = nil end
    if self.objectConfig == nil then self.objectConfig = nil end
    if self.templateFile == nil then self.templateFile = nil end
    if self.template == nil then self.template = nil end
    if self.dataFile == nil then self.dataFile = nil end
    if self.data == nil then self.data = nil end
    if self.type == nil then self.type = nil end
end

function TransformInfoTag._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return TransformInfoTag._new0(self, ...)
    elseif count == 1 then return TransformInfoTag._new1(self, ...)
    end
    error("No constructor of TransformInfoTag takes " .. count .. " arguments")
end

function TransformInfoTag.new(...)
    local self = setmetatable({}, TransformInfoTag)
    TransformInfoTag._jinit(self, ...)
    return self
end


function TransformInfoTag._new0(self)
    java_super_init(ModifyTag, self, TransformInfoRequestHelperFactory.new())
    TransformInfoTag._init_fields(self)
        -- super(...) made self above
    return self
end


function TransformInfoTag._new1(self, tagHelperFactoryInterface)
    java_super_init(ModifyTag, self, tagHelperFactoryInterface)
    TransformInfoTag._init_fields(self)
        -- super(...) made self above
    return self
end


function TransformInfoTag:setName(value)
        self.name_f = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().NAME, self.name_f)
end
java_overload(TransformInfoTag, "setName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setStoreName(value)
        self.storeName = value
        self:getPropertiesHashMap():put(StoreFrontData.getInstance().NAME, self.storeName)
end
java_overload(TransformInfoTag, "setStoreName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setObjectFile(value)
        self.objectFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECTFILENAME, self.objectFile)
end
java_overload(TransformInfoTag, "setObjectFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setObject(value)
        self.anyType = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECT, self.anyType)
end
java_overload(TransformInfoTag, "setObject", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setTemplateFile(value)
        self.templateFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().TEMPLATEFILENAME, self.templateFile)
end
java_overload(TransformInfoTag, "setTemplateFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setTemplate(value)
        self.template = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().TEMPLATE, self.template)
end
java_overload(TransformInfoTag, "setTemplate", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setDataFile(value)
        self.dataFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().DATAFILENAME, self.dataFile)
end
java_overload(TransformInfoTag, "setDataFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setData(value)
        self.data = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().DATA, self.data)
end
java_overload(TransformInfoTag, "setData", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setObjectConfigFile(value)
        self.objectConfigFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECTCONFIGFILENAME, self.objectConfigFile)
end
java_overload(TransformInfoTag, "setObjectConfigFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setObjectConfig(value)
        self.objectConfig = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECTCONFIG, self.objectConfig)
end
java_overload(TransformInfoTag, "setObjectConfig", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:setType(value)
        self.type = value
        self:getPropertiesHashMap():put(OutputTypeData.getInstance().NAME, self.type)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
            self.logUtil:putF(require("allbinary_java").to_string("TransformInfoTag type set: ") .. require("allbinary_java").to_string(self.type), self, "setType")
        end
end
java_overload(TransformInfoTag, "setType", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoTag:getName()
        return self.name_f
end
java_overload(TransformInfoTag, "getName", 0)


function TransformInfoTag:getObjectFile()
        return self.objectFile
end
java_overload(TransformInfoTag, "getObjectFile", 0)


-- throws JspTagException
function TransformInfoTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", java_super(ModifyTag, "doStartTag", 0)(self) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TransformInfoTag, "doStartTag", 0)

return TransformInfoTag

