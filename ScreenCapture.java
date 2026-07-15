import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;

public class ScreenCapture {
    public static void main(String[] args) throws AWTException, IOException, InterruptedException {
        String saveDir = "C:\\Capture";
        new File(saveDir).mkdirs();

        Robot robot = new Robot();
        Rectangle bounds = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd_HHmmss");

        long endTime = System.currentTimeMillis() + 2 * 60 * 60 * 1000;

        System.out.println("화면 캡처를 시작합니다.");
        System.out.println("저장 위치: " + saveDir);
        System.out.println("Ctrl+C를 누르면 언제든지 종료됩니다.");

        while (System.currentTimeMillis() < endTime) {
            BufferedImage capture = robot.createScreenCapture(bounds);
            String filename = fmt.format(new Date()) + ".png";
            ImageIO.write(capture, "png", new File(saveDir, filename));
            Thread.sleep(1000);
        }

        System.out.println("2시간이 경과하여 캡처를 종료했습니다.");
    }
}
