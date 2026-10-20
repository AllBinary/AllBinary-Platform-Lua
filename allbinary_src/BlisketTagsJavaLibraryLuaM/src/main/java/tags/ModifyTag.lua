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

-- local Method = require("java.lang.reflect.Method")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local HelperTag = require("tags.HelperTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ModifyTag = {}
ModifyTag.__index = ModifyTag
ModifyTag.className = "ModifyTag"
setmetatable(ModifyTag, {__index = HelperTag})

function ModifyTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ModifyTag.new(tagHelperFactoryInterface)
    local self = setmetatable(HelperTag.new(tagHelperFactoryInterface), ModifyTag)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws LicensingException
function ModifyTag:insert()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self:getHelper())
            local method = helperClass:getMethod("insert", nil)
            local result = method:invoke(self:getHelper(), nil)
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
function ModifyTag:delete()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self:getHelper())
            local method = helperClass:getMethod(self.commonStrings.delete, nil)
            local result = method:invoke(self:getHelper(), nil)
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
function ModifyTag:update()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self:getHelper())
            local method = helperClass:getMethod("update", nil)
            local result = method:invoke(self:getHelper(), nil)
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
function ModifyTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                local request = self.pageContext:getRequest()
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Command: ")
                stringBuffer:append(self:getCommand())
                stringBuffer:append(" Request URI: ")
                stringBuffer:append(request:getRequestURI())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            end
            if self:getCommand() ~= nil then
                self:setHelper()
                local commonStrings = CommonStrings.getInstance()
                if self:getCommand():compareTo(commonStrings.INSERT) == 0 then
                    local output = self:insert()
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                        self.pageContext:getOut():print(output .. "<br />")
                    end
                elseif self:getCommand():compareTo(commonStrings.DELETE) == 0 then
                    local output = self:delete()
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                        self.pageContext:getOut():print(output .. "<br />")
                    end
                elseif self:getCommand():compareTo(commonStrings.UPDATE) == 0 then
                    local output = self:update()
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                        self.pageContext:getOut():print(output .. "<br />")
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

return ModifyTag

