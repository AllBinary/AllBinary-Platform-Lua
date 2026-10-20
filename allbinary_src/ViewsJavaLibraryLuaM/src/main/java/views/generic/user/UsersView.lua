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
-- package views.generic.user

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local UserDomNode = require("org.allbinary.business.user.UserDomNode")
local UsersData = require("org.allbinary.business.user.UsersData")
local User = require("org.allbinary.business.user.modules.User")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UsersView = {}
UsersView.__index = UsersView
UsersView.className = "UsersView"
setmetatable(UsersView, {__index = HttpStoreComponentView})

function UsersView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userVector = nil
end


function UsersView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), UsersView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function UsersView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local usersNode = document:createElement(UsersData.NAME)
            local size = self.userVector:size()
            for index = 0, size - 1 do
                local userInterface = self.userVector:get(index)
                if userInterface ~= nil then
                    local node = UserDomNode.new(userInterface):toXmlNode(document)
                    usersNode:appendChild(node)
                else
                    self.logUtil:putF("UserHelper", self, "toXmlNode")
                end
            end
            return usersNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            return nil
        end
end


function UsersView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function UsersView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return UsersView

