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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicUserRoleFactory = {}
BasicUserRoleFactory.__index = BasicUserRoleFactory
BasicUserRoleFactory.className = "BasicUserRoleFactory"

function BasicUserRoleFactory:_init_fields()
    self.INACTIVITYTIMEOUT = 360000000
    self.CUSTOMERTIMEOUT = 360000000
    self.CUSTOMERMAXSESSIONTIME = 360000000
    self.MAXSESSIONTIME = 360000000
    self.INSTALLER = BasicUserRole.new("Installer", 16, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.ADMINISTRATOR = BasicUserRole.new("Administrator", 0, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.CUSTOMER = BasicUserRole.new("CustomerUser", "Customer User", 1, self.CUSTOMERTIMEOUT, self.CUSTOMERMAXSESSIONTIME)
    self.SUBSCRIBERCUSTOMER = BasicUserRole.new("SubscriberUser", "Subscriber User", 2, self.CUSTOMERTIMEOUT, self.CUSTOMERMAXSESSIONTIME)
    self.WHOLESALECUSTOMER = BasicUserRole.new("WholesaleUser", "Wholesale User", 3, self.CUSTOMERTIMEOUT, self.CUSTOMERMAXSESSIONTIME)
    self.STOREMANAGER = BasicUserRole.new("StoreManager", "Store Manager", 4, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.PRODUCTMANAGER = BasicUserRole.new("ProductManager", "Product Manager", 5, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.CUSTOMERMANAGER = BasicUserRole.new("UserManager", "User Manager", 6, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.PAYMENTMANAGER = BasicUserRole.new("PaymentManager", "Payment Manager", 7, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.ORDERMANAGER = BasicUserRole.new("OrderManager", "Order Manager", 8, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.WEBMANAGER = BasicUserRole.new("WebManager", "Web Manager", 9, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.REVIEWER = BasicUserRole.new("Reviewer", 10, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.SHIPPING = BasicUserRole.new("Shipping", 11, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.ADJUSTER = BasicUserRole.new("Adjuster", 12, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.WORKFLOWEDITOR = BasicUserRole.new("WorkFlowEditor", "WorkFlow Editor", 13, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.WIZARD = BasicUserRole.new("WizardUser", "Wizard User", 14, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
    self.VIEWEDITOR = BasicUserRole.new("ViewEditor", "View Editor", 15, self.MAXSESSIONTIME, self.INACTIVITYTIMEOUT)
end

function BasicUserRoleFactory.new()
    local self = setmetatable({}, BasicUserRoleFactory)
    self:_init_fields()
    return self
end


function BasicUserRoleFactory.getInstance()
        return BasicUserRoleFactory.instance
end

BasicUserRoleFactory.instance = BasicUserRoleFactory.new()

return BasicUserRoleFactory

