<?php

namespace IA\PaidMembershipBundle\Component\Subscription;

interface PeriodInterface
{
    /**
     * @return \DateTime
     */
    public function getFirstDate();

    /**
     * @return \DateTime
     */
    public function getLastDate();
}

