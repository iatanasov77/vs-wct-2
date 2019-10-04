<?php

namespace IA\PaidMembershipBundle\Component\Subscription;

/**
 * Represent a subscription period
 */
class Period extends \DatePeriod implements PeriodInterface
{
    /**
     * @var \DateTime
     */
    private $firstDate;

    /**
     * @var \DateTime
     */
    private $lastDate;

    /**
     * Get the first day of the subscription period
     *
     * @return \DateTime
     */
    public function getFirstDate()
    {
        return $this->firstDate;
    }

    /**
     * Get the last day of the subscription period
     *
     * @return \DateTime
     */
    public function getLastDate()
    {
        return $this->lastDate;
    }
}

