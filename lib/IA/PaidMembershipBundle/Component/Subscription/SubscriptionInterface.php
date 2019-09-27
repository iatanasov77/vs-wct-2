<?php

namespace IA\PaidMembershipBundle\Component\Subscription;

interface SubscriptionInterface
{
    /**
     * @return \DateInterval
     */
    public function getInterval();

    /**
     * @return SubscriptionPeriodInterface
     */
    public function getFirstPeriod();

    /**
     * @return SubscriptionPeriodInterface
     */
    public function getCurrentPeriod();

    /**
     * @return SubscriptionPeriodInterface[]
     */
    public function getPeriods();
}

