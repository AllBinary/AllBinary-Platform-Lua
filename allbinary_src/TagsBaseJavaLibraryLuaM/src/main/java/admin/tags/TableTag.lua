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

local TableTag = {}
package.loaded["admin.tags.TableTag"] = TableTag

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local TagHelperFactoryInterface = java_lazy("admin.taghelpers.TagHelperFactoryInterface")
local AbResponseHandler = java_lazy("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SqlStrings = java_lazy("org.allbinary.logic.communication.sql.SqlStrings")
local BooleanUtil = java_lazy("org.allbinary.logic.java.bool.BooleanUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local PropertiesTag = require("tags.PropertiesTag")
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

-- class table TableTag is declared before the requires
TableTag.__index = TableTag
TableTag.className = "TableTag"
TableTag.javaClassName = "admin.tags.TableTag"
setmetatable(TableTag, {__index = PropertiesTag})

function TableTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.enabled == nil then self.enabled = nil end
    if self.tagHelperFactoryInterface == nil then self.tagHelperFactoryInterface = nil end
    if self.tagRequestHelperFactoryInterface == nil then self.tagRequestHelperFactoryInterface = nil end
    if self.requestObject == nil then self.requestObject = nil end
    if self.current == nil then self.current = nil end
    if self.total == nil then self.total = nil end
end


function TableTag._jinit(self)
    java_super_init(PropertiesTag, self)
    TableTag._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function TableTag.new(...)
    local self = setmetatable({}, TableTag)
    TableTag._jinit(self, ...)
    return self
end


function TableTag:setIsSelected(enabled)
        self.enabled = enabled
end
java_overload(TableTag, "setIsSelected", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function TableTag:isEnabled()
        if not (StringValidationUtil.getInstance():isEmpty(self.enabled)) then
            if BooleanUtil.getInstance():getFromString(self.enabled) or rawequal(((self.enabled < "on" and -1) or (self.enabled > "on" and 1) or 0), 0) then
                return true
            end
        end
        return false
end
java_overload(TableTag, "isEnabled", 0)


function TableTag:setTagHelperFactory(tagHelperFactoryInterface)
        self.tagHelperFactoryInterface = tagHelperFactoryInterface
end
java_overload(TableTag, "setTagHelperFactory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TagHelperFactoryInterface")) end)


function TableTag:getTagHelperFactoryInterface()
        return self.tagHelperFactoryInterface
end
java_overload(TableTag, "getTagHelperFactoryInterface", 0)


function TableTag:setTagRequestHelperFactory(tagHelperFactoryInterface)
        self.tagRequestHelperFactoryInterface = tagHelperFactoryInterface
end
java_overload(TableTag, "setTagRequestHelperFactory", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TagHelperFactoryInterface")) end)


function TableTag:getTagRequestHelperFactoryInterface()
        return self.tagRequestHelperFactoryInterface
end
java_overload(TableTag, "getTagRequestHelperFactoryInterface", 0)


function TableTag:setCurrent(current)
        self.current = current
end
java_overload(TableTag, "setCurrent", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function TableTag:getCurrent()
        return self.current
end
java_overload(TableTag, "getCurrent", 0)


function TableTag:setTotal(total)
        self.total = total
end
java_overload(TableTag, "setTotal", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function TableTag:getTotal()
        return self.total
end
java_overload(TableTag, "getTotal", 0)


-- throws LicensingException
function TableTag:drop()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("drop", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to drop table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "drop", 0)


-- throws LicensingException
function TableTag:create()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("create", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to create table"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "create", 0)


-- throws LicensingException
function TableTag:restore()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("restore", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to restore backup"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "restore", 0)


-- throws LicensingException
function TableTag:backup()
        local try_ok, try_error, try_value = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("backup", nil)
            local result = method:invoke(anyType, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to make backup"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "backup", 0)


-- throws LicensingException
function TableTag:insert()
        local try_ok, try_error, try_value = pcall(function()
            local helperClass = getmetatable(self.requestObject)
            local method = helperClass:getMethod("insert", nil)
            local result = method:invoke(self.requestObject, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to insert"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "insert", 0)


-- throws LicensingException
function TableTag:delete()
        local try_ok, try_error, try_value = pcall(function()
            local helperClass = getmetatable(self.requestObject)
            local method = helperClass:getMethod(self.commonStrings.delete, nil)
            local result = method:invoke(self.requestObject, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to delete"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "delete", 0)


-- throws LicensingException
function TableTag:update()
        local try_ok, try_error, try_value = pcall(function()
            local helperClass = getmetatable(self.requestObject)
            local method = helperClass:getMethod("update", nil)
            local result = method:invoke(self.requestObject, nil)
            do return "__jreturn", result end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local error = "Failed to update"
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "update", 0)


-- throws JspTagException
function TableTag:doStartTag()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                local request = self.pageContext:getRequest()
                local stringBuffer = StringMaker.new()
                stringBuffer:append("TableTag Helper: ")
                stringBuffer:append((getmetatable(self:getTagHelperFactoryInterface()).javaClassName or getmetatable(self:getTagHelperFactoryInterface()).className))
                stringBuffer:append(" Request URI: ")
                stringBuffer:append(request:getRequestURI())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            if not rawequal(self:getTagRequestHelperFactoryInterface(), nil) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                    self.logUtil:putF(require("allbinary_java").to_string("TableTag RequestHelper: ") .. require("allbinary_java").to_string((getmetatable(self:getTagRequestHelperFactoryInterface()).javaClassName or getmetatable(self:getTagRequestHelperFactoryInterface()).className)), self, self.tagStrings.DO_START_TAG)
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                    self.logUtil:putF("TableTag RequestHelper: null", self, self.tagStrings.DO_START_TAG)
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAG) then
                self.logUtil:putF(require("allbinary_java").to_string("TableTag this.getCommand(): ") .. require("allbinary_java").to_string(self:getCommand()), self, self.tagStrings.DO_START_TAG)
            end
            if self:isEnabled() then
                if not rawequal(self:getCommand(), nil) then
                    if rawequal(self:getCommand():compareTo(self.commonStrings.INSERT), 0) or rawequal(self:getCommand():compareTo(SqlStrings.getInstance().INSERT_INTO), 0) or rawequal(self:getCommand():compareTo(self.commonStrings.DELETE), 0) or rawequal(self:getCommand():compareTo(self.commonStrings.UPDATE), 0) or rawequal(self:getCommand():compareTo(SqlStrings.getInstance().UPDATE), 0) then
                        self.requestObject = self:getTagRequestHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
                    end
                    if rawequal(self:getCommand():compareTo(self.commonStrings.INSERT), 0) or rawequal(self:getCommand():compareTo(SqlStrings.getInstance().INSERT_INTO), 0) then
                        self:insert()
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.DELETE), 0) then
                        self:delete()
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.UPDATE), 0) or rawequal(self:getCommand():compareTo(SqlStrings.getInstance().UPDATE), 0) then
                        self:update()
                    end
                    if rawequal(self:getCommand():compareTo(GLOBALS2.BACKUP), 0) then
                        local output = self:backup()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                        do return "__jreturn", self.SKIP_BODY end
                    elseif rawequal(self:getCommand():compareTo(GLOBALS2.RESTORE), 0) then
                        self:getPropertiesHashMap():put("current", self:getCurrent())
                        self:getPropertiesHashMap():put("total", self:getTotal())
                        local output = self:restore()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                        do return "__jreturn", self.SKIP_BODY end
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.DROP), 0) then
                        local output = self:drop()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                        do return "__jreturn", self.SKIP_BODY end
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.CREATE), 0) then
                        local output = self:create()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                        do return "__jreturn", self.SKIP_BODY end
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.INSERT), 0) then
                        local output = self:insert()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.DELETE), 0) then
                        local output = self:delete()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                    elseif rawequal(self:getCommand():compareTo(self.commonStrings.UPDATE), 0) then
                        local output = self:update()
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(require("allbinary_java").to_string(output) .. require("allbinary_java").to_string("<br />"))
                        end
                    end
                end
            end
            do return "__jreturn", self.EVAL_BODY_INCLUDE end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TableTag, "doStartTag", 0)

return TableTag

