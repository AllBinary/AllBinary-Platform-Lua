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
-- package org.allbinary.business.user.modules.admin.store.web.view.editor

-- local HashMap = require("java.util.HashMap")
local User = require("org.allbinary.business.user.modules.User")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ViewEditorWebStoreAdminUser = {}
ViewEditorWebStoreAdminUser.__index = ViewEditorWebStoreAdminUser
ViewEditorWebStoreAdminUser.className = "ViewEditorWebStoreAdminUser"
setmetatable(ViewEditorWebStoreAdminUser, {__index = User})

function ViewEditorWebStoreAdminUser.new(...)
    local count = select("#", ...)
    if count == 0 then return ViewEditorWebStoreAdminUser._new0(...)
    elseif count == 1 then return ViewEditorWebStoreAdminUser._new1(...)
    end
end


function ViewEditorWebStoreAdminUser._new0()
    local self = setmetatable(User.new(), ViewEditorWebStoreAdminUser)
        -- super(...) made self above
    return self
end


function ViewEditorWebStoreAdminUser._new1(userHashMap)
    local self = setmetatable(User.new(userHashMap), ViewEditorWebStoreAdminUser)
        -- super(...) made self above
    return self
end


function ViewEditorWebStoreAdminUser:validateSession(weblisketSession)
        User.validateSession(self, weblisketSession)
        self:updateSession(weblisketSession)
end


function ViewEditorWebStoreAdminUser:updateSession(weblisketSession)
        weblisketSession:setStoreName(self:getPermissions())
end

return ViewEditorWebStoreAdminUser

