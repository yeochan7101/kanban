package models.works;

public class SavaService {

    private WorkDao workDao = new UpgradeWorkDao();

    public SavaService(WorkDao workDao){
        this.workDao = workDao;
    }


    public void save(Work work){


        // work 데이터 검증 (유효성 검사)

        workDao.save(work); // 의존
    }
}
