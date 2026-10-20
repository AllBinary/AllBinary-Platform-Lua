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

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local UserHelperFactory = require("admin.taghelpers.UserHelperFactory")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local TableTag = require("admin.tags.TableTag")

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
setmetatable(UserTag, {__index = TableTag})

function UserTag:_init_fields()
    self.role = nil
    self.enable = nil
end


function UserTag.new()
    local self = setmetatable(TableTag.new(), UserTag)
    self:_init_fields()
        self:setTagHelperFactory(UserHelperFactory.new())
        self:setTagRequestHelperFactory(UserHelperFactory.new())
    return self
end


function UserTag:setRole(value)
        self.role = value
        self:getPropertiesHashMap():put(UserRoleData.NAME, self.role)
end


function UserTag:setEnable(value)
        self.enable = value
        self:getPropertiesHashMap():put(EntryData.getInstance().ENABLE, self.enable)
end


-- throws JspTagException
function UserTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                return TableTag.doStartTag(self)
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return UserTag

