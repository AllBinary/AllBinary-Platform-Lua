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
-- package org.allbinary.business.user.role

local UserRoleFactory = {}
package.loaded["org.allbinary.business.user.role.UserRoleFactory"] = UserRoleFactory

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

local UserFactory = java_lazy("org.allbinary.business.user.modules.UserFactory")
local AdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.AdminUserFactory")
local StoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.StoreAdminUserFactory")
local CustomerStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.customer.CustomerStoreAdminUserFactory")
local OrderStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.order.OrderStoreAdminUserFactory")
local AdjustOrderStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.order.adjust.AdjustOrderStoreAdminUserFactory")
local ReviewOrderStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.order.review.ReviewOrderStoreAdminUserFactory")
local ShipOrderStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.order.ship.ShipOrderStoreAdminUserFactory")
local PaymentStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUserFactory")
local ProductStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.product.ProductStoreAdminUserFactory")
local WebStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.web.WebStoreAdminUserFactory")
local ViewEditorWebStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.web.view.editor.ViewEditorWebStoreAdminUserFactory")
local WizardWebStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.web.wizard.WizardWebStoreAdminUserFactory")
local WorkflowEditorWebStoreAdminUserFactory = java_lazy("org.allbinary.business.user.modules.admin.store.web.workflow.editor.WorkflowEditorWebStoreAdminUserFactory")
local SubscriberUserFactory = java_lazy("org.allbinary.business.user.modules.customer.subscriber.SubscriberUserFactory")
local WholesaleUserFactory = java_lazy("org.allbinary.business.user.modules.customer.wholesale.WholesaleUserFactory")
local UserRoleB = java_lazy("org.allbinary.business.user.role.UserRoleB")

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

-- class table UserRoleFactory is declared before the requires
UserRoleFactory.__index = UserRoleFactory
UserRoleFactory.className = "UserRoleFactory"
UserRoleFactory.javaClassName = "org.allbinary.business.user.role.UserRoleFactory"

function UserRoleFactory:_init_fields()
    self.basicUserRoleFactory = BasicUserRoleFactory.getInstance()
    self.INSTALLER = UserRoleB.new(self.basicUserRoleFactory.INSTALLER, nil)
    self.ADMINISTRATOR = UserRoleB.new(self.basicUserRoleFactory.ADMINISTRATOR, AdminUserFactory.new())
    self.CUSTOMER = UserRoleB.new(self.basicUserRoleFactory.CUSTOMER, UserFactory.new())
    self.SUBSCRIBERCUSTOMER = UserRoleB.new(self.basicUserRoleFactory.SUBSCRIBERCUSTOMER, SubscriberUserFactory.new())
    self.WHOLESALECUSTOMER = UserRoleB.new(self.basicUserRoleFactory.WHOLESALECUSTOMER, WholesaleUserFactory.new())
    self.STOREMANAGER = UserRoleB.new(self.basicUserRoleFactory.STOREMANAGER, StoreAdminUserFactory.new())
    self.PRODUCTMANAGER = UserRoleB.new(self.basicUserRoleFactory.PRODUCTMANAGER, ProductStoreAdminUserFactory.new())
    self.CUSTOMERMANAGER = UserRoleB.new(self.basicUserRoleFactory.CUSTOMERMANAGER, CustomerStoreAdminUserFactory.new())
    self.PAYMENTMANAGER = UserRoleB.new(self.basicUserRoleFactory.PAYMENTMANAGER, PaymentStoreAdminUserFactory.new())
    self.ORDERMANAGER = UserRoleB.new(self.basicUserRoleFactory.ORDERMANAGER, OrderStoreAdminUserFactory.new())
    self.WEBMANAGER = UserRoleB.new(self.basicUserRoleFactory.WEBMANAGER, WebStoreAdminUserFactory.new())
    self.REVIEWER = UserRoleB.new(self.basicUserRoleFactory.REVIEWER, ReviewOrderStoreAdminUserFactory.new())
    self.SHIPPING = UserRoleB.new(self.basicUserRoleFactory.SHIPPING, ShipOrderStoreAdminUserFactory.new())
    self.ADJUSTER = UserRoleB.new(self.basicUserRoleFactory.ADJUSTER, AdjustOrderStoreAdminUserFactory.new())
    self.WORKFLOWEDITOR = UserRoleB.new(self.basicUserRoleFactory.WORKFLOWEDITOR, WorkflowEditorWebStoreAdminUserFactory.new())
    self.WIZARD = UserRoleB.new(self.basicUserRoleFactory.WIZARD, WizardWebStoreAdminUserFactory.new())
    self.VIEWEDITOR = UserRoleB.new(self.basicUserRoleFactory.VIEWEDITOR, ViewEditorWebStoreAdminUserFactory.new())
end

function UserRoleFactory._jinit(self)
    UserRoleFactory._init_fields(self)
    return self
end

function UserRoleFactory.new()
    return UserRoleFactory._jinit(setmetatable({}, UserRoleFactory))
end


function UserRoleFactory.getInstance()
        return UserRoleFactory.instance_f
end

UserRoleFactory.instance_f = UserRoleFactory.new()

return UserRoleFactory

