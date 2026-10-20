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

local UserFactory = require("org.allbinary.business.user.modules.UserFactory")
local AdminUserFactory = require("org.allbinary.business.user.modules.admin.AdminUserFactory")
local StoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.StoreAdminUserFactory")
local CustomerStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.customer.CustomerStoreAdminUserFactory")
local OrderStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.order.OrderStoreAdminUserFactory")
local AdjustOrderStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.order.adjust.AdjustOrderStoreAdminUserFactory")
local ReviewOrderStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.order.review.ReviewOrderStoreAdminUserFactory")
local ShipOrderStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.order.ship.ShipOrderStoreAdminUserFactory")
local PaymentStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.payment.PaymentStoreAdminUserFactory")
local ProductStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.product.ProductStoreAdminUserFactory")
local WebStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.web.WebStoreAdminUserFactory")
local ViewEditorWebStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.web.view.editor.ViewEditorWebStoreAdminUserFactory")
local WizardWebStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.web.wizard.WizardWebStoreAdminUserFactory")
local WorkflowEditorWebStoreAdminUserFactory = require("org.allbinary.business.user.modules.admin.store.web.workflow.editor.WorkflowEditorWebStoreAdminUserFactory")
local SubscriberUserFactory = require("org.allbinary.business.user.modules.customer.subscriber.SubscriberUserFactory")
local WholesaleUserFactory = require("org.allbinary.business.user.modules.customer.wholesale.WholesaleUserFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserRoleFactory = {}
UserRoleFactory.__index = UserRoleFactory
UserRoleFactory.className = "UserRoleFactory"

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

function UserRoleFactory.new()
    local self = setmetatable({}, UserRoleFactory)
    self:_init_fields()
    return self
end


function UserRoleFactory.getInstance()
        return UserRoleFactory.instance
end

UserRoleFactory.instance = UserRoleFactory.new()

return UserRoleFactory

