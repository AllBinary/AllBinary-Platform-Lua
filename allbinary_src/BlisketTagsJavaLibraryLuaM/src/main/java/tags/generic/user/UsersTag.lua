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

local UsersTag = {}
UsersTag.__index = UsersTag
UsersTag.className = "UsersTag"
setmetatable(UsersTag, {__index = StoreValidationTransformTag})

function UsersTag:_init_fields()
    self.role = nil
end


function UsersTag.new()
    local self = setmetatable(StoreValidationTransformTag.new(), UsersTag)
    self:_init_fields()
    return self
end


function UsersTag:setRole(value)
        self.role = value
end


-- throws JspTagException
function UsersTag:doStartTag()
        local try_ok, try_error = pcall(function()
            self:setName("Generic Users View")
            self:setObjectFile("views.generic.user.UsersValidationView")
            if self:getCommand() ~= nil then
                self:getPropertiesHashMap():put(UserRoleData.NAME, self.role)
                if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0 then
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

return UsersTag

