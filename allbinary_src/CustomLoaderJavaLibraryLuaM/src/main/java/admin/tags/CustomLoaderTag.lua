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
-- package admin.tags

local CustomLoaderTag = {}
package.loaded["admin.tags.CustomLoaderTag"] = CustomLoaderTag

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

-- local Method = require("java.lang.reflect.Method")
local HashMap = java_lazy("java.util.HashMap")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local CustomLoaderHelperFactory = java_lazy("admin.taghelpers.CustomLoaderHelperFactory")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
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

-- class table CustomLoaderTag is declared before the requires
CustomLoaderTag.__index = CustomLoaderTag
CustomLoaderTag.className = "CustomLoaderTag"
CustomLoaderTag.javaClassName = "admin.tags.CustomLoaderTag"
setmetatable(CustomLoaderTag, {__index = CustomTagSupport})

function CustomLoaderTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.command == nil then self.command = nil end
    if self.webappPath == nil then self.webappPath = nil end
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
end


function CustomLoaderTag._jinit(self)
    java_super_init(CustomTagSupport, self)
    CustomLoaderTag._init_fields(self)
    return self
end

function CustomLoaderTag.new(...)
    local self = setmetatable({}, CustomLoaderTag)
    CustomLoaderTag._jinit(self, ...)
    return self
end


function CustomLoaderTag:setCommand(command)
        self.command = command
end
java_overload(CustomLoaderTag, "setCommand", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function CustomLoaderTag:setWebappPath(value)
        self.webappPath = value
end
java_overload(CustomLoaderTag, "setWebappPath", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws LicensingException
function CustomLoaderTag:setCustomLoaderWebappPath()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = CustomLoaderHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local helperClass = getmetatable(anyType)
            local methodParams = {getmetatable(self.webappPath)}
            local methodArgs = {self.webappPath}
            local setMethod = helperClass:getMethod("setWebappPath", methodParams)
            setMethod:invoke(anyType, methodArgs)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
end
java_overload(CustomLoaderTag, "setCustomLoaderWebappPath", 0)


-- throws JspTagException
function CustomLoaderTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                self.logUtil:putF(self.commonStrings.START, self, self.tagStrings.DO_START_TAG)
            end
            if not rawequal(self.command, nil) then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                if rawequal(((self.command < GLOBALS2.SET and -1) or (self.command > GLOBALS2.SET and 1) or 0), 0) then
                    self:setCustomLoaderWebappPath()
                end
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
java_overload(CustomLoaderTag, "doStartTag", 0)

return CustomLoaderTag

