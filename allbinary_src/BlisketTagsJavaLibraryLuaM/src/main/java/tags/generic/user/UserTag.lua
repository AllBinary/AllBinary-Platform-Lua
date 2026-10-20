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
-- package tags.generic.user

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local StoreValidationTransformTag = require("tags.StoreValidationTransformTag")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserTag = {}
UserTag.__index = UserTag
UserTag.className = "UserTag"
setmetatable(UserTag, {__index = StoreValidationTransformTag})

function UserTag:_init_fields()
    self.role = nil
end


function UserTag.new()
    local self = setmetatable(StoreValidationTransformTag.new(), UserTag)
    self:_init_fields()
    return self
end


function UserTag:setRole(value)
        self.role = value
        self:getPropertiesHashMap():put(UserRoleData.NAME, self.role)
end


-- throws JspTagException
function UserTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:getCommand() ~= nil then
                if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.EDIT + org.allbinary.globals.GLOBALS2.EDIT) == 0 then
                    self:setName("Edit Session Validation User View - i.e. User Profile Edit")
                    self:setObjectFile("views.generic.user.EditValidationView")
                end
                if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.NEW) == 0 then
                    self:setName("New User View")
                    self:setObjectFile("views.generic.user.NewUserView")
                elseif self:getCommand():compareTo(self.commonStrings.INSERT) == 0 then
                    self:setName("Add Validation User View")
                    self:setObjectFile("views.generic.user.AddValidationUserView")
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0 then
                    self:setName("Validation User View")
                    self:setObjectFile("views.generic.user.ViewValidationUserView")
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.EDIT) == 0 then
                    self:setName("Validation User View")
                    self:setObjectFile("views.generic.user.EditValidationUserView")
                elseif self:getCommand():compareTo(self.commonStrings.UPDATE) == 0 then
                    self:setName("Update Validation User View")
                    self:setObjectFile("views.generic.user.UpdateValidationUserView")
                elseif self:getCommand():compareTo(self.commonStrings.DELETE) == 0 then
                    self:setName("Delete Validation User View")
                    self:setObjectFile("views.generic.user.DeleteValidationUserView")
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.BACKUP) == 0 then
                    error(java_exception("Exception", "View not implemented"), 0)
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.RESTORE) == 0 then
                    error(java_exception("Exception", "View not implemented"), 0)
                elseif self:getCommand():compareTo(self.commonStrings.DROP) == 0 then
                    error(java_exception("Exception", "View not implemented"), 0)
                elseif self:getCommand():compareTo(self.commonStrings.CREATE) == 0 then
                    error(java_exception("Exception", "View not implemented"), 0)
                else
                    error(java_exception("Exception", "No Such View Command: " .. tostring(self:getCommand())), 0)
                end
                return StoreValidationTransformTag.doStartTag(self)
            end
            error(java_exception("Exception", "Command Null"), 0)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return UserTag

