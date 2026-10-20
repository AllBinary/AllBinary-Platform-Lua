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

-- local Method = require("java.lang.reflect.Method")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SqlStrings = require("org.allbinary.logic.communication.sql.SqlStrings")
local BooleanUtil = require("org.allbinary.logic.java.bool.BooleanUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local PropertiesTag = require("tags.PropertiesTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TableTag = {}
TableTag.__index = TableTag
TableTag.className = "TableTag"
setmetatable(TableTag, {__index = PropertiesTag})

function TableTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.enabled = nil
    self.tagHelperFactoryInterface = nil
    self.tagRequestHelperFactoryInterface = nil
    self.requestObject = nil
    self.current = nil
    self.total = nil
end


function TableTag.new()
    local self = setmetatable(PropertiesTag.new(), TableTag)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TableTag:setIsSelected(enabled)
        self.enabled = enabled
end


-- throws Exception
function TableTag:isEnabled()
        if not StringValidationUtil.getInstance():isEmpty(self.enabled) then
            if BooleanUtil.getInstance():getFromString(self.enabled) or ((self.enabled < "on" and -1) or (self.enabled > "on" and 1) or 0) == 0 then
                return true
            end
        end
        return false
end


function TableTag:setTagHelperFactory(tagHelperFactoryInterface)
        self.tagHelperFactoryInterface = tagHelperFactoryInterface
end


function TableTag:getTagHelperFactoryInterface()
        return self.tagHelperFactoryInterface
end


function TableTag:setTagRequestHelperFactory(tagHelperFactoryInterface)
        self.tagRequestHelperFactoryInterface = tagHelperFactoryInterface
end


function TableTag:getTagRequestHelperFactoryInterface()
        return self.tagRequestHelperFactoryInterface
end


function TableTag:setCurrent(current)
        self.current = current
end


function TableTag:getCurrent()
        return self.current
end


function TableTag:setTotal(total)
        self.total = total
end


function TableTag:getTotal()
        return self.total
end


-- throws LicensingException
function TableTag:drop()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("drop", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to drop table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.DROP, e)
            end
            return error
        end
end


-- throws LicensingException
function TableTag:create()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("create", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to create table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "create()", e)
            end
            return error
        end
end


-- throws LicensingException
function TableTag:restore()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("restore", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to restore backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "restore()", e)
            end
            return error
        end
end


-- throws LicensingException
function TableTag:backup()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("backup", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to make backup"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "backup()", e)
            end
            return error
        end
end


-- throws LicensingException
function TableTag:insert()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self.requestObject)
            local method = helperClass:getMethod("insert", nil)
            local result = method:invoke(self.requestObject, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to insert"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insert()", e)
            end
            return error
        end
end


-- throws LicensingException
function TableTag:delete()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self.requestObject)
            local method = helperClass:getMethod(self.commonStrings.delete, nil)
            local result = method:invoke(self.requestObject, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to delete"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "delete()", e)
            end
            return error
        end
end


-- throws LicensingException
function TableTag:update()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self.requestObject)
            local method = helperClass:getMethod("update", nil)
            local result = method:invoke(self.requestObject, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end


-- throws JspTagException
function TableTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                local request = self.pageContext:getRequest()
                local stringBuffer = StringMaker.new()
                stringBuffer:append("TableTag Helper: ")
                stringBuffer:append(getmetatable(self:getTagHelperFactoryInterface()).className)
                stringBuffer:append(" Request URI: ")
                stringBuffer:append(request:getRequestURI())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            if self:getTagRequestHelperFactoryInterface() ~= nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                    self.logUtil:putF("TableTag RequestHelper: " .. getmetatable(self:getTagRequestHelperFactoryInterface()).className, self, self.tagStrings.DO_START_TAG)
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                    self.logUtil:putF("TableTag RequestHelper: null", self, self.tagStrings.DO_START_TAG)
                end
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF("TableTag this.getCommand(): " .. tostring(self:getCommand()), self, self.tagStrings.DO_START_TAG)
            end
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    if self:getCommand():compareTo(self.commonStrings.INSERT) == 0 or self:getCommand():compareTo(SqlStrings.getInstance().INSERT_INTO) == 0 or self:getCommand():compareTo(self.commonStrings.DELETE) == 0 or self:getCommand():compareTo(self.commonStrings.UPDATE) == 0 or self:getCommand():compareTo(SqlStrings.getInstance().UPDATE) == 0 then
                        self.requestObject = self:getTagRequestHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
                    end
                    if self:getCommand():compareTo(self.commonStrings.INSERT) == 0 or self:getCommand():compareTo(SqlStrings.getInstance().INSERT_INTO) == 0 then
                        self:insert()
                    elseif self:getCommand():compareTo(self.commonStrings.DELETE) == 0 then
                        self:delete()
                    elseif self:getCommand():compareTo(self.commonStrings.UPDATE) == 0 or self:getCommand():compareTo(SqlStrings.getInstance().UPDATE) == 0 then
                        self:update()
                    end
                    if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.BACKUP) == 0 then
                        local output = self:backup()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                        return self.SKIP_BODY
                    elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.RESTORE) == 0 then
                        self:getPropertiesHashMap():put("current", self:getCurrent())
                        self:getPropertiesHashMap():put("total", self:getTotal())
                        local output = self:restore()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                        return self.SKIP_BODY
                    elseif self:getCommand():compareTo(self.commonStrings.DROP) == 0 then
                        local output = self:drop()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                        return self.SKIP_BODY
                    elseif self:getCommand():compareTo(self.commonStrings.CREATE) == 0 then
                        local output = self:create()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                        return self.SKIP_BODY
                    elseif self:getCommand():compareTo(self.commonStrings.INSERT) == 0 then
                        local output = self:insert()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                    elseif self:getCommand():compareTo(self.commonStrings.DELETE) == 0 then
                        local output = self:delete()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                    elseif self:getCommand():compareTo(self.commonStrings.UPDATE) == 0 then
                        local output = self:update()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                    end
                end
            end
            return self.EVAL_BODY_INCLUDE
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return TableTag

