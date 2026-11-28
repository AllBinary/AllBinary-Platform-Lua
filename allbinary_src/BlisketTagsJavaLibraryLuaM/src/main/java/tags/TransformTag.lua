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
-- package tags

local TransformTag = {}
package.loaded["tags.TransformTag"] = TransformTag

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
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local ViewHelperFactory = java_lazy("taghelpers.ViewHelperFactory")
local TransformInfoTag = require("tags.transform.info.TransformInfoTag")
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

-- class table TransformTag is declared before the requires
TransformTag.__index = TransformTag
TransformTag.className = "TransformTag"
TransformTag.javaClassName = "tags.TransformTag"
setmetatable(TransformTag, {__index = TransformInfoTag})

function TransformTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformTag._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return TransformTag._new0(self, ...)
    elseif count == 1 then return TransformTag._new1(self, ...)
    end
    error("No constructor of TransformTag takes " .. count .. " arguments")
end

function TransformTag.new(...)
    local self = setmetatable({}, TransformTag)
    TransformTag._jinit(self, ...)
    return self
end


function TransformTag._new0(self)
    java_super_init(TransformInfoTag, self, ViewHelperFactory.new())
    TransformTag._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TransformTag._new1(self, tagHelperFactoryInterface)
    java_super_init(TransformInfoTag, self, tagHelperFactoryInterface)
    TransformTag._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function TransformTag:view()
        local try_ok, try_error, try_value = pcall(function()
            local result = getmetatable(self:getHelper()):getMethod("view", nil):invoke(self:getHelper(), nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TransformTag, "view", 0)


-- throws JspTagException
function TransformTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                self.logUtil:putF(require("allbinary_java").to_string("Creating with: \n") .. require("allbinary_java").to_string(tostring(self:getPropertiesHashMap())), self, self.tagStrings.DO_START_TAG)
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("ViewTag Start For: ")
                stringBuffer:append(self:getName())
                stringBuffer:append("\nViewFile: ")
                stringBuffer:append(self:getObjectFile())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            self:setHelper()
            self.pageContext:getOut():print(self:view())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                self.logUtil:putF("Tag End", self, self.tagStrings.DO_START_TAG)
            end
            do return "__jreturn", self.SKIP_BODY end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TransformTag, "doStartTag", 0)

return TransformTag

