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
-- package views.admin.user

local UserDomNode = require("org.allbinary.business.user.UserDomNode")
local UserInterface = require("org.allbinary.business.user.UserInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local HttpContextView = require("views.business.context.HttpContextView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserView = {}
UserView.__index = UserView
UserView.className = "UserView"
setmetatable(UserView, {__index = HttpContextView})

function UserView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.user = nil
end


function UserView.new(transformInfoInterface)
    local self = setmetatable(HttpContextView.new(transformInfoInterface), UserView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function UserView:addDomNodeInterfaces()
        self:addDomNodeInterface(UserDomNode.new(self.user))
end


-- throws Exception
function UserView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpContextView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return UserView

